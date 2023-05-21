import json
f=open("bigTown.ldtk")
data = json.load(f)
f.close()
npcs = data['levels'][0]['layerInstances'][0]['entityInstances']


for n in npcs:
	name = n['fieldInstances'][0]['realEditorValues'][0]['params'][0]
	msg =  n['fieldInstances'][1]['realEditorValues'][0]['params'][0]
	print("_____________")
	print("x:",n["__grid"][0].to_bytes(2,"little"))
	print("y:",n["__grid"][1].to_bytes(2,"little"))
	#print(len(name),"||",name)
	#print(len(msg),"||",msg)





