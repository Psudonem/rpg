import json


f=open("bigTown.ldtk")


data = json.load(f)

f.close()



level = data['levels'][0]['layerInstances'][0]['gridTiles']



a=[[0]*256 for i in range(256)]
for l in level:
      
      x = int(l['px'][0])/8
      y = int(l['px'][1])/8
      t = l['t']
      print(x,y,l['t'])

      
