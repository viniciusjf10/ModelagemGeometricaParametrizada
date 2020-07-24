#TRABALHO
#Questao 1
mod = Sketchup.active_model
ent=mod.entities
ent.clear!
prompts = ["Qtde de Pavimentos", "Largura da Escada", "Largura do Degrau", "Altura dos Degraus", "Pe Direito", "Largura do Patamar", "Comprimento do Patamar", "Espessura do Patamar"]
defaults = [3, 120, 30, 17, 300, 120, 300, 10]
input = UI.inputbox prompts, defaults, "Parametros da escada"
QPav, LEsc, LDeg, ADeg, PDir, LPat, CPat, EPat = input


while (ADeg < 16 || ADeg > 19)
	UI.messagebox "Altura dos degraus invalida!"
	prompts = ["Qtde de Pavimentos", "Largura da Escada", "Largura do Degrau", "Altura dos Degraus", "Pe Direito", "Largura do Patamar", "Comprimento do Patamar", "Espessura do Patamar"]
	defaults = [3, 120, 30, 17, 300, 120, 300, 10]
	input = UI.inputbox prompts, defaults, "Parametros da escada"
	QPav, LEsc, LDeg, ADeg, PDir, LPat, CPat, EPat = input
end

while (LEsc < 26)
	UI.messagebox "Largura da escada invalida!"
	prompts = ["Qtde de Pavimentos", "Largura da Escada","Largura do Degrau", "Altura dos Degraus", "Pe Direito", "Largura do Patamar", "Comprimento do Patamar", "Espessura do Patamar"]
	defaults = [3, 120, 30, 17, 300, 120, 300, 10]
	input = UI.inputbox prompts, defaults, "Parametros da escada"
	QPav, LEsc, LDeg, ADeg, PDir, LPat, CPat, EPat = input
end

while (LDeg < 26)
	UI.messagebox "Largura da escada invalida!"
	prompts = ["Qtde de Pavimentos", "Largura da Escada","Largura do Degrau", "Altura dos Degraus", "Pe Direito", "Largura do Patamar", "Comprimento do Patamar", "Espessura do Patamar"]
	defaults = [3, 120, 30, 17, 300, 120, 300, 10]
	input = UI.inputbox prompts, defaults, "Parametros da escada"
	QPav, LEsc, LDeg,  ADeg, PDir, LPat, CPat, EPat = input
end

#Conversao de Medidas


#Declarando variaveis auxiliares

x=0
y=0
z=0
NDeg = PDir / ADeg

#Criando os degraus em grupo
for d in 0..NDeg-1 do
 p1=[x,y,z]
 p2=[LEsc,y,z]
 p3=[LEsc,LDeg,z]
 p4=[x,LDeg,z]
 g1 = ent.add_group
 square_face = g1.entities.add_face p1,p2,p3,p4 
 square_face.pushpull -ADeg
 y=y - LDeg
 z=z - ADeg
end
#Multiplicando os degraus para fazer a escada bruta









