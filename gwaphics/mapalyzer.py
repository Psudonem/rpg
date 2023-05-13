import json


f=open("bigTown.ldtk")


data = json.load(f)

f.close()


level = data['levels'][0]['layerInstances'][1]['gridTiles']



#a=[[0]*256 for i in range(256)]

print(len(level))
for l in level:
      
      x = int(l['px'][0]/8)
      y = int(l['px'][1]/8)
      t = l['t']
      print(x,y,int(l['t']))

print("====================")

#hmmm

out = open("map.bin","wb")
out.close()
      
