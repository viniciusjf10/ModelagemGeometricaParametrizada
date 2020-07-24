mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
ent.clear!
p1 = [10,10,0]
p2 = [20,10,0]
p3 = [20,20,0]
p4 = [10,20,0]
g1 = ent.add_group
square_face = g1.entities.add_face p1,p2,p3,p4
square_face.pushpull -20
tr = Geom::Transformation.rotation [15,15,0] , [0,0,1] ,45.degrees
g1.transform! tr
