var admin = require("firebase-admin");
const data = require("./data.json");

var serviceAccount = require("./serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

let promises = [];
for(let i =0; i< data.length; i++){
   promises.push(admin.firestore().collection('Norms').doc(`${i}`).create(data[i]));
}

Promise.all(promises);