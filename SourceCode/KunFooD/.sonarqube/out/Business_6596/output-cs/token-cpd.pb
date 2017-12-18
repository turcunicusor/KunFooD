˝
iC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Business\FridgeRepository.cs
	namespace 	
Business
 
{		 
public

 

class

 
FridgeRepository

 !
:

" #
GenericRepository 
< 
PairItem "
>" #
,# $
IFridgeRepository% 6
{ 
private 
readonly 
IDatabaseContext )
_databaseContext* :
;: ;
public 
FridgeRepository 
(  
IDatabaseContext  0
databaseContext1 @
)@ A
:B C
baseD H
(H I
databaseContextI X
)X Y
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
public 
async 
Task 
Delete  
(  !
Guid! %
ingredientId& 2
,2 3
Guid4 8
recipeId9 A
)A B
{ 	
var 
pairItem 
= 
Get 
( 
ingredientId +
,+ ,
recipeId- 5
)5 6
;6 7
_databaseContext 
. 
	PairItems &
.& '
Remove' -
(- .
pairItem. 6
.6 7
Result7 =
)= >
;> ?
await 
Save 
( 
) 
; 
} 	
public 
async 
Task 
< 
PairItem "
>" #
Get$ '
(' (
Guid( ,
ingredientId- 9
,9 :
Guid; ?
recipeId@ H
)H I
{ 	
return 
await 
_databaseContext )
.) *
	PairItems* 3
.3 4
FirstOrDefaultAsync4 G
(G H
pairItemH P
=>Q S
pairItem 
. 
IngredientId !
.! "
Equals" (
(( )
ingredientId) 5
)5 6
&&7 9
pairItem: B
.B C
	RecipieIdC L
.L M
EqualsM S
(S T
recipeIdT \
)\ ]
)] ^
;^ _
} 	
}   
}!! ú
jC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Business\GenericRepository.cs
	namespace 	
Business
 
{		 
public

 

abstract

 
class

 
GenericRepository

 +
<

+ ,
T

, -
>

- .
:

/ 0
IGenericRepository

1 C
<

C D
T

D E
>

E F
where

G L
T

M N
:

O P
class

Q V
{ 
private 
readonly 
IDatabaseContext )
_databaseContext* :
;: ;
private 
readonly 
DbSet 
< 
T  
>  !
	_entities" +
;+ ,
	protected 
GenericRepository #
(# $
IDatabaseContext$ 4
databaseContext5 D
)D E
{ 	
_databaseContext 
= 
databaseContext .
;. /
	_entities 
= 
( 
databaseContext (
as) +
	DbContext, 5
)5 6
?6 7
.7 8
Set8 ;
<; <
T< =
>= >
(> ?
)? @
;@ A
} 	
public 
virtual 
async 
Task !
<! "
IEnumerable" -
<- .
T. /
>/ 0
>0 1
GetAll2 8
(8 9
)9 :
{ 	
return 
await 
	_entities "
." #
ToListAsync# .
(. /
)/ 0
;0 1
} 	
public 
virtual 
async 
Task !
<! "
T" #
># $
FindById% -
(- .
Guid. 2
id3 5
)5 6
{ 	
return 
await 
	_entities "
." #
	FindAsync# ,
(, -
id- /
)/ 0
;0 1
} 	
public 
virtual 
async 
Task !
Add" %
(% &
T& '
entity( .
). /
{   	
await!! 
	_entities!! 
.!! 
AddAsync!! $
(!!$ %
entity!!% +
)!!+ ,
;!!, -
await"" 
Save"" 
("" 
)"" 
;"" 
}## 	
public%% 
virtual%% 
async%% 
Task%% !
Delete%%" (
(%%( )
Guid%%) -
id%%. 0
)%%0 1
{&& 	
var'' 
itemToRemove'' 
='' 
await'' $
FindById''% -
(''- .
id''. 0
)''0 1
;''1 2
if(( 
((( 
itemToRemove(( 
!=(( 
null((  $
)(($ %
{)) 
	_entities** 
.** 
Remove**  
(**  !
itemToRemove**! -
)**- .
;**. /
await++ 
Save++ 
(++ 
)++ 
;++ 
},, 
}-- 	
public// 
virtual// 
async// 
Task// !
Edit//" &
(//& '
T//' (
entity//) /
)/// 0
{00 	
	_entities11 
.11 
Update11 
(11 
entity11 #
)11# $
;11$ %
await22 
Save22 
(22 
)22 
;22 
}33 	
public55 
virtual55 
async55 
Task55 !
Save55" &
(55& '
)55' (
{66 	
await77 
(77 
(77 
	DbContext77 
)77 
_databaseContext77 /
)77/ 0
.770 1
SaveChangesAsync771 A
(77A B
)77B C
;77C D
}88 	
}99 
}:: µ
vC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Business\IngredientsCategoryRepository.cs
	namespace 	
Business
 
{ 
public 

class )
IngredientsCategoryRepository .
:/ 0
GenericRepository 
< 
IngredientCategory ,
>, -
,- .*
IIngredientsCategoryRepository/ M
{		 
private

 
readonly

 
IDatabaseContext

 )
_databaseContext

* :
;

: ;
public )
IngredientsCategoryRepository ,
(, -
IDatabaseContext- =
databaseContext> M
)M N
:O P
baseQ U
(U V
databaseContextV e
)e f
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
} 
} ç
nC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Business\IngredientsRepository.cs
	namespace 	
Business
 
{ 
public 

class !
IngredientsRepository &
:' (
GenericRepository 
< 

Ingredient $
>$ %
,% &"
IIngredientsRepository' =
{		 
private

 
readonly

 
IDatabaseContext

 )
_databaseContext

* :
;

: ;
public !
IngredientsRepository $
($ %
IDatabaseContext% 5
databaseContext6 E
)E F
:G H
baseI M
(M N
databaseContextN ]
)] ^
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
} 
} ˘
jC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Business\RecipesRepository.cs
	namespace 	
Business
 
{ 
public 

class 
RecipesRepository "
:# $
GenericRepository 
< 
Recipe  
>  !
,! "
IRecipesRepository# 5
{		 
private

 
readonly

 
IDatabaseContext

 )
_databaseContext

* :
;

: ;
public 
RecipesRepository  
(  !
IDatabaseContext! 1
databaseContext2 A
)A B
:C D
baseE I
(I J
databaseContextJ Y
)Y Z
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
} 
} à
hC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Business\UsersRepository.cs
	namespace		 	
Business		
 
{

 
public 

class 
UsersRepository  
:! "
GenericRepository 
< 
User 
> 
,  
IUsersRepository! 1
{ 
private 
readonly 
IDatabaseContext )
_databaseContext* :
;: ;
public 
UsersRepository 
( 
IDatabaseContext /
databaseContext0 ?
)? @
:A B
baseC G
(G H
databaseContextH W
)W X
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
User& *
>* +
>+ ,
	GetAdmins- 6
(6 7
)7 8
{ 	
return 
await 
_databaseContext )
.) *
Users* /
./ 0
Where0 5
(5 6
user6 :
=>; =
user> B
.B C
IsAdminC J
)J K
.K L
ToListAsyncL W
(W X
)X Y
;Y Z
} 	
public 
async 
Task 
< 
User 
> 

GetByEmail  *
(* +
string+ 1
email2 7
)7 8
{ 	
return 
await 
_databaseContext )
.) *
Users* /
./ 0
FirstOrDefaultAsync0 C
(C D
userD H
=>I K
userL P
.P Q
EmailQ V
.V W
EqualsW ]
(] ^
email^ c
)c d
)d e
;e f
} 	
} 
} 