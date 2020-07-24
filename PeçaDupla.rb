mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
ent.clear!


prompts = ["Base", "Altura", "Largura", "Distancia"]
defaults = [0,0,0,0]
input = UI.inputbox prompts, defaults, "Digite os parametros para criaçao da peça"
base, altura, largura, distancia = input
  


p1=[0,0,0]
p2=[largura,0,0]
p3=[largura,base,0]
p4=[0,base,0]
square_face=ent.add_face p1,p2,p3,p4
square_face.pushpull -altura

p1=[base,0,0]
p2=[largura,base,0]
p3=[base+distancia, largura,0]
p4=[base+distancia,0,0]
square_face=ent.add_face p1,p2,p3,p4
square_face.pushpull -altura/2

circle = ent.add_circle [base+distancia, (largura/2), 0], [0, 0, 1], largura/2
circle.first.faces.first.pushpull -5

 

