import json
f=open("bigTown.ldtk")
data = json.load(f)
f.close()
npcs = data['levels'][0]['layerInstances'][0]['entityInstances']


f = open("bigtown_npc.bin","wb")
f.write(len(npcs).to_bytes(2,"little"))
for n in npcs:
	name = n['fieldInstances'][0]['realEditorValues'][0]['params'][0]
	msg =  n['fieldInstances'][1]['realEditorValues'][0]['params'][0]
	print("_____________")
	f.write(len(name).to_bytes(2,"little"))
	f.write(bytes(name,encoding="utf-8"))
	f.write(len(msg).to_bytes(2,"little"))
	f.write(bytes(msg,encoding="utf-8"))
	#print(len(name),"||",name)
	#print(len(msg),"||",msg)





