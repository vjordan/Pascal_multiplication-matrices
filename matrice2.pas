program matrice;

const M=100;
type tab=array[1..M,1..M] of integer;
var L,C,colonne,ligne:integer;
	T,T1,T2,T3:tab;
	ok:boolean;
	
	
procedure saisiemat (var N:integer; var P:integer);
var i,j:integer;

begin

	for i:= 1 to N do
	begin
		for j:=1 to P do
		begin
			writeln('Donnez le nombre pour la ligne ',i,' et la colonne ',j,' de la matrice.');
			readln(T[i,j]);
		end;
	end;
	
end;


procedure affichemat (var T:tab);
var i,j:integer;

begin	

	for i:=1 to L do
	begin
		for j:=1 to C do
		begin
			if (T[i,j]>9999) then
				write(' ',T[i,j],' ')
			else
				if (T[i,j]>999) then
					write('  ',T[i,j],' ')
				else
					if (T[i,j]>99) then
						write('   ',T[i,j],' ')
					else
						if (T[i,j]>9) then
							write('    ',T[i,j],' ')
						else
							if (T[i,j]>-1) then
								write('     ',T[i,j],' ');
			if (T[i,j]<-9999) then					
				write(T[i,j],' ')				
			else					
				if (T[i,j]<-999) then
					write(' ',T[i,j],' ')
				else
					if (T[i,j]<-99) then
						write('  ',T[i,j],' ')
					else
						if (T[i,j]<-9) then
							write('   ',T[i,j],' ')
						else
							if (T[i,j]<0) then
								write('    ',T[i,j],' ');
		end;
	writeln();
	writeln();
	end;
	
end;


procedure mulmat(T1,T2:tab);
var i,j,k:integer;

begin

	for i:=1 to ligne do
	begin
		for j:=1 to C do
		begin
		T3[i,j]:=0;
			for k:=1 to L do
			begin
				T3[i,j]:=T1[i,k]*T2[k,j]+T3[i,j];
			end;
		end;
	end;
	L:=ligne;
	
end;


BEGIN

repeat
	writeln('Combien de lignes a votre matrice 1?');
	readln(L);
	writeln('Combien de colonnes a votre matrice 1?');
	readln(C);
	if (L<M) and (C<M) and (L>0) and (C>0) then
		ok:=true
	else
	begin
		ok:=false;
		writeln();
		writeln('Vous avez donne un nombre de lignes et/ou de colonnes trop grand ou illogique!');
		writeln();
	end;		
until (ok);
	writeln();
	writeln();
saisiemat(L,C);
	writeln();
	writeln();
colonne:=C;
ligne:=L;
writeln('La matrice 1 est:');
	writeln();
affichemat(T);
	writeln();
	writeln();
T1:=T;
repeat
	writeln('Combien de lignes a votre matrice 2?');
	readln(L);
	writeln('Combien de colonnes a votre matrice 2?');
	readln(C);
	if (L<M) and (C<M) and (L>0) and (C>0) then
		ok:=true
	else
	begin
		ok:=false;
		writeln();
		writeln('Vous avez donne un nombre de lignes et/ou de colonnes trop grand ou illogique!');
		writeln();
	end;
until (ok);
	writeln();
	writeln();
saisiemat(L,C);
	writeln();
	writeln();
writeln('La matrice 2 est:');
	writeln();
affichemat(T);
	writeln();
	writeln();
T2:=T;
if (colonne=L) then
begin
	mulmat(T1,T2);
	writeln('Le produit des deux matrices vaut:');
	writeln();
	affichemat(T3);
end
else
	writeln('Multiplication entre les deux matrices impossible, car le nombre de colonnes de la matrice 1 nest pas egal au nombre de lignes de la matrice 2!');
readln;

END.
