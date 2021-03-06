/*
 * Copyright 2011 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.social.showcase.mongo;

import java.security.Principal;
import java.net.UnknownHostException;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import java.util.Iterator;
import java.util.List;
import javax.inject.Inject;
import javax.inject.Provider;
import org.bson.types.ObjectId;

import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.showcase.account.Account;
import org.springframework.social.showcase.account.AccountRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MongoController {

  private final Provider<ConnectionRepository> connectionRepositoryProvider;
  private final AccountRepository accountRepository;
  @Inject
  private final Mongo mongo;

  @Inject
  public MongoController(Provider<ConnectionRepository> connectionRepositoryProvider, AccountRepository accountRepository, Mongo mongo) {
    this.connectionRepositoryProvider = connectionRepositoryProvider;
    this.accountRepository = accountRepository;
    this.mongo = mongo;
  }

  @RequestMapping("/mongo")
  public String home(Principal currentUser, Model model) {
    model.addAttribute("connectionsToProviders", getConnectionRepository().findAllConnections());

    model.addAttribute("mongoDatabaseNames", mongo.getDatabaseNames());
    model.addAttribute(accountRepository.findAccountByUsername(currentUser.getName()));
    return "mongo";
  }

  private ConnectionRepository getConnectionRepository() {
    return connectionRepositoryProvider.get();
  }

  @RequestMapping(value = "/mongo/database/{dbName}", method = RequestMethod.GET)
  public String useDatabase(@PathVariable("dbName") String dbName, Model model) {
    model.addAttribute("mongoDatabaseNames", mongo.getDatabaseNames());

    DB db = mongo.getDB(dbName);
    model.addAttribute("currentDbName", dbName);

    model.addAttribute("collectionNames", db.getCollectionNames());
    return "mongo/database";
  }

  @RequestMapping(value = "/mongo/database/{dbName}/{collectionName:.+}", method = RequestMethod.GET)
  public String showCollection(@PathVariable("dbName") String dbName, @PathVariable("collectionName") String collectionName, Model model) {
    return showCollection(dbName, collectionName, "raw", model);
  }

  @RequestMapping(value = "/mongo/database/{dbName}/{collectionName:.+}/{type}", method = RequestMethod.GET)
  public String showCollection(@PathVariable("dbName") String dbName, @PathVariable("collectionName") String collectionName, @PathVariable("type") String type, Model model) {
    model.addAttribute("mongoDatabaseNames", mongo.getDatabaseNames());

    DB db = mongo.getDB(dbName);
    DBCollection dbCollection = db.getCollection(collectionName);

    model.addAttribute("currentDbName", dbName);
    model.addAttribute("dbStats", db.getStats());
     
    model.addAttribute("dbCollection", dbCollection);
   // model.addAttribute("dbCollectionrows", com.mongodb.util.JSON.serialize(dbCollection.find()));
     model.addAttribute("dbCollectionrows", dbCollection.find());
    model.addAttribute("dataType", type);
    model.addAttribute("currentCollection", collectionName);


    //stats
    if ("stats".equals(type)) {
      model.addAttribute("dbCount", dbCollection.getCount());
      model.addAttribute("dbIndexInfo", dbCollection.getIndexInfo());

      model.addAttribute("dbStats", dbCollection.getStats());
      model.addAttribute("dbFullName", dbCollection.getFullName());
      model.addAttribute("dbOptions", dbCollection.getOptions());
      model.addAttribute("dbWriteConcern", dbCollection.getWriteConcern());
    }

    //End of stats
    if ("id".equals(type)) {
      System.out.println("id=" + type);
      BasicDBObject query = new BasicDBObject();
      query.put("id", "4f473b300364c27d3cd69ddf");
      model.addAttribute("dbCollectionrows", dbCollection.find(query));
      System.out.println("count=" + dbCollection.find(query).count());

    }



    model.addAttribute("collectionNames", db.getCollectionNames());
    return "mongo/table/" + type;
  }
  
  
  @RequestMapping(value = "/mongo/database/{dbName}/{collectionName:.+}/{type}/{idVal}", method = RequestMethod.GET)
  public String showCollection(@PathVariable("dbName") String dbName, @PathVariable("collectionName") String collectionName, @PathVariable("type") String type, @PathVariable("idVal") String idVal, Model model) {
    model.addAttribute("mongoDatabaseNames", mongo.getDatabaseNames());

    DB db = mongo.getDB(dbName);
    DBCollection dbCollection = db.getCollection(collectionName);

    model.addAttribute("currentDbName", dbName);
    model.addAttribute("dbCollection", dbCollection);
    model.addAttribute("dbCollectionrows", dbCollection.find());
    model.addAttribute("dataType", type);
    model.addAttribute("currentCollection", collectionName);


    //stats
    if ("stats".equals(type)) {
      model.addAttribute("dbCount", dbCollection.getCount());
      model.addAttribute("dbIndexInfo", dbCollection.getIndexInfo());

      model.addAttribute("dbStats", dbCollection.getStats());
      model.addAttribute("dbFullName", dbCollection.getFullName());
      model.addAttribute("dbOptions", dbCollection.getOptions());
      model.addAttribute("dbWriteConcern", dbCollection.getWriteConcern());
    }

    //End of stats
    if ("id".equals(type)) {
      System.out.println("id=" + type);
      DBObject searchById = new BasicDBObject("_id", new ObjectId(idVal));

       model.addAttribute("dbCollectionrows", dbCollection.find(searchById));
      System.out.println("count=" + dbCollection.find(searchById).count());

    }



    model.addAttribute("collectionNames", db.getCollectionNames());
    return "mongo/table/" + type;
  }
}
