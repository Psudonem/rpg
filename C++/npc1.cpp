#include <stdio.h>
#include <string>
#include <iostream>
// ok fixed :3

class Npc{
public:
	std::string Name;
	std::string Speech;
	bool isLive;

	std::string speak();
};



bool personHere;
void npcTalk(Npc person){
	std::cout<<"+";
	for(int i=0;i<person.Name.length()+2;i++){
		std::cout<<"-";
	}
	std::cout<<"+\n";
	std::cout<<"| "<<person.Name<<" |\n";
	std::cout<<"+";
	for(int i=0;i<person.Name.length()+2;i++){
		std::cout<<"-";
	}
	std::cout<<"+";


	int diff = person.Speech.length()+1 - person.Name.length();
/*
Bill - 4
Have you played atari today? - 28
28 -4 = 24
*/



	for(int i=0; i<diff;i++){
		std::cout<<"-";
	}std::cout<<"+";

	std::cout<<"\n| \"";
	std::cout<<person.Speech;
	std::cout<<"\" |\n+";

	for(int i=0; i<diff+person.Name.length()+3;i++){
		std::cout<<"-";
	}std::cout<<"+\n";

}

int px,py;

Npc map[5][5];

void cls(){
	system("cls");// lets gooo it works!!
}

void drawMap(){
	cls();
	for(int y=0;y<5;y++){
		for(int x=0;x<5;x++){
			if(px==x && py==y){
				std::cout<<"P";
			}else if(map[x][y].isLive==true){
				std::cout<<"N";
			}else{
				std::cout<<".";
			}
		}
		std::cout<<"\n";
	}
}
void checkTile(){
	if(px>=0 && px<5 && py>=0 && py<5){
		if(map[px][py].isLive){
			personHere=true;
		}
	}
	
}
void playerMovement(){
	
	if(personHere){
		npcTalk(map[px][py]);
		//std::cout<<"\n There is someone here! Press t to talk to them.\n\n";	
	}
	std::cout<<"action (wasd to move)?";
	char s[1];
	std::cin.read(s,1);

	if(s[0]=='s')py++;
	else if(s[0]=='w')py--;
	else if(s[0]=='d')px++;
	else if(s[0]=='a')px--;
	/*else if(s[0]=='t'){
		npcTalk(map[px][py]);
		std::cout<<"\n\n space to quit";
		while(s[0]!=' '){
			std::cin.read(s,1);
		}
		playerMovement()
	}*/

	if(py>4)py--;
	if(px>4)px--;

	if(py<0)py++;
	if(px<0)px++;
}
int main(){
	px = 0;
	py = 0;
	// learn how to clear screen in cpp

	map[2][2].Name="Bill";
	map[2][2].Speech = "Have you played Atari today?";
	map[2][2].isLive=true;



	map[3][0].Name="Jon T. Hater";
	map[3][0].Speech = "I hate games!!!!";
	map[3][0].isLive=true;


	/*printf("npc test\n\n");
	npcTalk(map[2][2]);*/

	/*while(true){

	}*/

	while(py>=0){
		drawMap();
		personHere=false;
		checkTile();
		playerMovement();}

	return 0;
}



