# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection
a=[7,10,20,-1,0,-10,200,0]
menor=a[0]
contp=0
contn=0

a.each_index do |i|
  if menor>a[i]
    menor = a[i]
  end
end
puts menor

a.each_index do |i|
  if a[i]>=0
  contp=contp+1
  end
end  
puts contp

a.each_index do |i|
  if a[i]<0
  contn=contn+1
  end
end
puts contn

soma=0
a.each_index do |i|
 soma=soma+a[i]
end







 
