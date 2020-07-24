#TRABALHO
#Questao 2
mod = Sketchup.active_model
ent=mod.entities
ent.clear!
prompts = ["Pe Direito (cm)", "Raio da escada (cm)", "Numero de Degraus", "Diametro do Tubo (cm)"]
defaults = [330, 75, 15, 15]    #Valores adotados para atender ao default de altura=22; diâmetro interno=15; raio da escada= média entre 90 e 60  (Medidas em cm)
input = UI.inputbox prompts, defaults, "Meu dialogo"
PDir, Raio, NDeg, DTub = input

while (PDir / NDeg > 25)    #Análise do limite da altura do degrau
	UI.messagebox "Valor de pe direito e numero de degraus incompativeis!"
	prompts = ["Pe Direito (cm)", "Raio da escada (cm)", "Numero de Degraus", "Diametro do Tubo (cm)"]
	defaults = [300, 75, 15, 15]
	input = UI.inputbox prompts, defaults, "Meu dialogo"
	PDir, Raio, NDeg, DTub = input
end

while (Raio > 90 || Raio <60)  #Análise dos limites do raio da escada
	UI.messagebox "Raio da escada invalido!"
	prompts = ["Pe Direito (cm)", "Raio da escada (cm)", "Numero de Degraus", "Diametro do Tubo (cm)"]
	defaults = [300, 75, 15, 15]
	input = UI.inputbox prompts, defaults, "Meu dialogo"
	PDir, Raio, NDeg, DTub = input
end

PDir = PDir.cm
Raio = Raio.cm
DTub = DTub.cm

DCirc = DTub + 9.cm   #Circulo de apoio do degrau no tubo

g1 = ent.add_group
circulo = g1.entities.add_circle [0,0,0], [0,0,1], DCirc/ 2
circulo_face = g1.entities.add_face circulo
circulo.first.faces[0].pushpull -(PDir/ NDeg)
tubo = g1.entities.add_circle [0,0,PDir/ NDeg], [0,0,1], DTub/ 2
tubo_face = g1.entities.add_face tubo
tubo.first.faces.first.pushpull -(PDir/ NDeg)

#DEGRAU
g2 = ent.add_group
a=0.25881905*Raio #Usando sen 15º
b=0.96592583*Raio #Usando cos 15º
degrau=g2.entities.add_face [-a, 0, PDir/ NDeg], [a,0,PDir/ NDeg], [a,Raio,PDir/ NDeg], [-a,Raio,PDir/ NDeg]
degrau.pushpull -4.cm
lin1=g2.entities.add_line [-(DCirc/ 2), 0, PDir/ NDeg], [-a, b, PDir/ NDeg]
lin1.faces[0].pushpull -4.cm
lin2=g2.entities.add_line [(DCirc/ 2), 0, PDir/ NDeg], [a, b, PDir/ NDeg]
lin2.faces[1].pushpull -4.cm
arc1=g2.entities.add_arc [0, 0, PDir/ NDeg], [0, 1, 0], [0, 0, 1], Raio, 15.degrees, -15.degrees, 15
arc1[0].faces[0].pushpull -4.cm
arc2=g2.entities.add_arc [0, 0, PDir/ NDeg], [0, 1, 0], [0, 0, 1], (DCirc/ 2), 90.degrees, -90.degrees, 15
arc2[0].faces[1].pushpull -4.cm

for i in 1..(NDeg-1)
	g3 = g1.copy
	g4 = g2.copy
	tr = Geom::Transformation.translation [0, 0, (i*(PDir/ NDeg))]
	rot = Geom::Transformation.rotation [0, 0, i*(PDir/ NDeg)], [0,0,1],( (i*28).degrees) #angulo menor do que 30º para evitar vão
	g3.transform! tr
	g3.transform! rot
	g4.transform! tr
	g4.transform! rot
end
