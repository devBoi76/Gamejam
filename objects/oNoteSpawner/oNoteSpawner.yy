{
  "$GMObject":"",
  "%Name":"oNoteSpawner",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":64,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":1,"eventType":2,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"oNoteSpawner",
  "overriddenProperties":[],
  "parent":{
    "name":"Pieciolinia",
    "path":"folders/XXX/Pieciolinia.yy",
  },
  "parentObjectId":null,
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"csv_note_file","filters":[],"listItems":[
        "\"Garrett_Generated1.csv\"",
      ],"multiselect":false,"name":"csv_note_file","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"","varType":2,},
    {"$GMObjectProperty":"v1","%Name":"enemy_obj","filters":[
        "GMObject",
      ],"listItems":[],"multiselect":false,"name":"enemy_obj","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"noone","varType":5,},
    {"$GMObjectProperty":"v1","%Name":"enemy_music","filters":[
        "GMSound",
      ],"listItems":[],"multiselect":false,"name":"enemy_music","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"","varType":5,},
    {"$GMObjectProperty":"v1","%Name":"hero_music","filters":[
        "GMSound",
      ],"listItems":[],"multiselect":false,"name":"hero_music","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"","varType":5,},
    {"$GMObjectProperty":"v1","%Name":"prefight_chat","filters":[],"listItems":[],"multiselect":false,"name":"prefight_chat","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"true","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"send_back_room","filters":[
        "GMRoom",
      ],"listItems":[],"multiselect":false,"name":"send_back_room","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"","varType":5,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_pieciolinia",
    "path":"sprites/spr_pieciolinia/spr_pieciolinia.yy",
  },
  "spriteMaskId":null,
  "visible":true,
}