import json


f=open("bigTown.ldtk")

data = json.load(f)

f.close()

level = data['levels'][0]['layerInstances'][1]['gridTiles']




f=open("bigTown.bin","wb")

f.write((len(level).to_bytes(2,"little")))
for l in level:
	x = int(l['px'][0]/8)
	y = int(l['px'][1]/8)
	t = l['t']
	print(x.to_bytes(2,"little"),y.to_bytes(2,"little"),int(l['t']).to_bytes(2,"little"))
	f.write(x.to_bytes(2,"little"))
	f.write(y.to_bytes(2,"little"))
	f.write(int(l['t']).to_bytes(2,"little"))
f.close()
