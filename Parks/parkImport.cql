Cypher to load simplified:
 
LOAD CSV WITH HEADERS FROM 'http://2a6e70ea.ngrok.io/simplified.csv' as line
 
CREATE (r:Receptor {
   name: line.name,
   polyline: line.polyline
})
 
RETURN COUNT(r)
 
 
…to load full:
 
LOAD CSV WITH HEADERS FROM 'file:///nr.csv' as line
 
CREATE (p:Point {
   location: point({ latitude: toFloat(line.lat), longitude: toFloat(line.lon) })
})
 
MERGE (r:Receptor {
   name: line.name,
   polyline: line.polyline
})
 
CREATE (p)-[:BELONGS_TO]->(r)
 
RETURN COUNT(r)