�
eC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\Category.cs
	namespace 	
Data
 
. 
Domain 
{ 
public 

class 
Category 
{ 
private 
Category 
( 
) 
{ 	
}

 	
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
public
string
Name
{
get
;
private
set
;
}
public 
string 
Description !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
static 
Category 
Create %
(% &
string& ,
name- 1
,1 2
string3 9
description: E
)E F
{ 	
var 
instance 
= 
new 
Category '
{( )
Id* ,
=- .
new/ 2
Guid3 7
(7 8
)8 9
,9 :
	CreatedAt; D
=E F
DateTimeG O
.O P
NowP S
}T U
;U V
instance 
. 
Update 
( 
name  
,  !
description" -
)- .
;. /
return 
instance 
; 
} 	
public 
void 
Update 
( 
string !
name" &
,& '
string( .
description/ :
): ;
{ 	
Name 
= 
name 
; 
Description 
= 
description %
;% &
} 	
} 
} �
gC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\Ingredient.cs
	namespace 	
Data
 
. 
Domain 
{ 
public 

class 

Ingredient 
{ 
private 

Ingredient 
( 
) 
{ 	
}

 	
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
public
Guid
IngredientCategoryId
{
get
;
private
set
;
}
public 
String 
Name 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
String 
MeasuredUnit "
{# $
get% (
;( )
private* 1
set2 5
;5 6
}7 8
public 
double 
Cost 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
static 

Ingredient  
Create! '
(' (
Guid( , 
ingredientCategoryId- A
,A B
stringC I
nameJ N
,N O
stringP V
measuredUnitW c
,c d
doublee k
costl p
)p q
{ 	
var 
instance 
= 
new 

Ingredient )
{* +
Id, .
=/ 0
Guid1 5
.5 6
NewGuid6 =
(= >
)> ?
}@ A
;A B
instance 
. 
Update 
(  
ingredientCategoryId 0
,0 1
name2 6
,6 7
measuredUnit8 D
,D E
costF J
)J K
;K L
return 
instance 
; 
} 	
public 
void 
Update 
( 
Guid  
ingredientCategoryId  4
,4 5
string6 <
name= A
,A B
stringC I
measuredUnitJ V
,V W
doubleX ^
cost_ c
)c d
{ 	 
IngredientCategoryId  
=! " 
ingredientCategoryId# 7
;7 8
Name 
= 
name 
; 
MeasuredUnit 
= 
measuredUnit '
;' (
Cost 
= 
cost 
; 
} 	
}   
}!! �
oC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\IngredientCategory.cs
	namespace 	
Data
 
. 
Domain 
{ 
public 

class 
IngredientCategory #
{ 
private 
IngredientCategory "
(" #
)# $
{ 	
}

 	
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
public
String
Name
{
get
;
private
set
;
}
public 
static 
IngredientCategory (
Create) /
(/ 0
string0 6
name7 ;
); <
{ 	
var 
instance 
= 
new 
IngredientCategory 1
{2 3
Id4 6
=7 8
Guid9 =
.= >
NewGuid> E
(E F
)F G
}H I
;I J
instance 
. 
Update 
( 
name  
)  !
;! "
return 
instance 
; 
} 	
public 
void 
Update 
( 
string !
name" &
)& '
{ 	
Name 
= 
name 
; 
} 	
} 
} �	
xC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IFridgeRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface 
IFridgeRepository &
{ 
void 
AddPairItem
( 
PairItem !
pairItem" *
)* +
;+ ,
void		 
DeletePairItem		
(		 
Guid		  
ingredientId		! -
,		- .
Guid		/ 3
recipeId		4 <
)		< =
;		= >
void

 
EditPairItem


(

 
PairItem

 "
pairItem

# +
)

+ ,
;

, -
PairItem 
GetPairItem 
( 
Guid !
ingredientId" .
,. /
Guid0 4
recipeId5 =
)= >
;> ?
IReadOnlyCollection 
< 
PairItem $
>$ %
GetAll& ,
(, -
)- .
;. /
}
} �
�C:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IIngredientsCategoryRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface *
IIngredientsCategoryRepository 3
{ 
void 
Add
( 
IngredientCategory #
ingredientCategory$ 6
)6 7
;7 8
void		 
Delete		
(		 
Guid		 
id		 
)		 
;		 
void

 
Edit


(

 
IngredientCategory

 $
ingredientCategory

% 7
)

7 8
;

8 9
IngredientCategory 
Get 
( 
Guid #
id$ &
)& '
;' (
IReadOnlyCollection 
< 
IngredientCategory .
>. /
GetAll0 6
(6 7
)7 8
;8 9
}
} �
}C:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IIngredientsRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface "
IIngredientsRepository +
{ 
void 

( 

Ingredient %

ingredient& 0
)0 1
;1 2
void		 
DeleteIngredient		
(		 
Guid		 "
id		# %
)		% &
;		& '
void

 
EditIngredient


(

 

Ingredient

 &

ingredient

' 1
)

1 2
;

2 3

Ingredient 

(  !
Guid! %
id& (
)( )
;) *
IReadOnlyCollection 
< 

Ingredient &
>& '
GetAll( .
(. /
)/ 0
;0 1
}
} �
yC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IRecipesRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface 
IRecipesRepository '
{ 
void 
	AddRecipe
( 
Recipe 
recipe $
)$ %
;% &
void		 
DeleteRecipe		
(		 
Guid		 
id		 !
)		! "
;		" #
void

 

EditRecipe


(

 
Recipe

 
recipe

 %
)

% &
;

& '
Recipe 
	GetRecipe 
( 
Guid 
id  
)  !
;! "
IReadOnlyCollection 
< 
Recipe "
>" #
GetAll$ *
(* +
)+ ,
;, -
}
} �
wC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IUsersRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface 
IUsersRepository %
{ 
void 
AddUser
( 
User 
user 
) 
;  
void		 

DeleteUser		
(		 
Guid		 
id		 
)		  
;		  !
void

 
EditUser


(

 
User

 
user

 
)

  
;

  !
User 
GetUser
( 
Guid 
id 
) 
; 
IReadOnlyCollection 
< 
User  
>  !
GetAll" (
(( )
)) *
;* +
}
} �
eC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\PairItem.cs
	namespace 	
Data
 
. 
Domain 
{ 
public 

class 
PairItem 
{ 
private 
PairItem 
( 
) 
{ 	
}

 	
public 
Guid 
IngredientId  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
public 
Guid 
	RecipieId 
{ 
get  #
;# $
private% ,
set- 0
;0 1
}2 3
public
double
Quantity
{
get
;
private
set
;
}
public 
static 
PairItem 
Create %
(% &
Guid& *
ingredientId+ 7
,7 8
Guid9 =
	recipieId> G
,G H
doubleI O
quantityP X
)X Y
{ 	
var 
instance 
= 
new 
PairItem '
(' (
)( )
;) *
instance 
. 
Update 
( 
ingredientId (
,( )
	recipieId* 3
,3 4
quantity5 =
)= >
;> ?
return 
instance 
; 
} 	
public 
void 
Update 
( 
Guid 
ingredientId  ,
,, -
Guid. 2
	recipieId3 <
,< =
double> D
quantityE M
)M N
{ 	
IngredientId 
= 
ingredientId '
;' (
	RecipieId 
= 
	recipieId !
;! "
Quantity 
= 
quantity 
;  
} 	
} 
} �
aC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\Post.cs
	namespace 	
Data
 
. 
Domain 
{ 
public 

class 
Post 
{ 
private 
Post 
( 
) 
{ 	
}

 	
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
public
string
Content
{
get
;
private
set
;
}
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
Guid 
ThreadId 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
Guid 
UserId 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
static 
Post 
Create !
(! "
string" (
content) 0
,0 1
Guid2 6
threadId7 ?
,? @
GuidA E
userIdF L
)L M
{ 	
var 
instance 
= 
new 
Post #
{$ %
Id& (
=) *
new+ .
Guid/ 3
(3 4
)4 5
,5 6
	CreatedAt7 @
=A B
DateTimeC K
.K L
NowL O
,O P
ThreadIdQ Y
=Z [
threadId\ d
,d e
UserIdf l
=m n
userIdo u
}v w
;w x
instance 
. 
Update 
( 
content #
)# $
;$ %
return 
instance 
; 
} 	
public 
void 
Update 
( 
string !
content" )
)) *
{ 	
Content 
= 
content 
; 
} 	
} 
} �
cC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\Recipe.cs
	namespace 	
Data
 
. 
Domain 
{ 
public 

class 
Recipe 
{ 
private 
Recipe 
( 
) 
{ 	
}

 	
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
public
Guid
UserId
{
get
;
private
set
;
}
public 
String 
Content 
{ 
get  #
;# $
private% ,
set- 0
;0 1
}2 3
public 
int 
PreparationTime "
{# $
get% (
;( )
private* 1
set2 5
;5 6
}7 8
public 
double 
Cost 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
String 
Status 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
double 
Rating 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
int 
VotesNumber 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
public 
static 
Recipe 
Create #
(# $
Guid$ (
userId) /
,/ 0
string1 7
content8 ?
,? @
intA D
preparationTimeE T
,T U
doubleV \
cost] a
,a b
stringc i
statusj p
,p q
doubler x
ratingy 
,	 �
int 
votesNumber 
) 
{ 	
var 
instance 
= 
new 
Recipe %
{& '
Id( *
=+ ,
new- 0
Guid1 5
(5 6
)6 7
,7 8
UserId9 ?
=@ A
userIdB H
}I J
;J K
instance 
. 
Update 
( 
content #
,# $
preparationTime% 4
,4 5
cost6 :
,: ;
status< B
,B C
ratingD J
,J K
votesNumberL W
)W X
;X Y
return 
instance 
; 
} 	
public 
void 
Update 
( 
string !
content" )
,) *
int+ .
preparationTime/ >
,> ?
double@ F
costG K
,K L
stringM S
statusT Z
,Z [
double\ b
ratingc i
,i j
int 
votesNumber 
) 
{ 	
Content   
=   
content   
;   
PreparationTime!! 
=!! 
preparationTime!! -
;!!- .
Cost"" 
="" 
cost"" 
;"" 
Status## 
=## 
status## 
;## 
Rating$$ 
=$$ 
rating$$ 
;$$ 
VotesNumber%% 
=%% 
votesNumber%% %
;%%% &
}&& 	
}'' 
}(( �
cC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\Thread.cs
	namespace 	
Data
 
. 
Domain 
{ 
public 

class 
Thread 
{ 
private 
Thread 
( 
) 
{ 	
}

 	
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
public
string
Name
{
get
;
private
set
;
}
public 
string 
Description !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
Guid 
UserId 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
Guid 

CategoryId 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
public 
static 
Thread 
Create #
(# $
string$ *
name+ /
,/ 0
string1 7
description8 C
,C D
GuidE I
userIdJ P
,P Q
GuidR V

categoryIdW a
)a b
{ 	
var 
instance 
= 
new 
Thread %
{& '
Id( *
=+ ,
new- 0
Guid1 5
(5 6
)6 7
,7 8
	CreatedAt9 B
=C D
DateTimeE M
.M N
NowN Q
,Q R
UserIdS Y
=Z [
userId\ b
,b c

CategoryIdd n
=o p

categoryIdq {
}| }
;} ~
return 
instance 
; 
} 	
public 
void 
Update 
( 
string !
name" &
,& '
string( .
description/ :
): ;
{ 	
Name 
= 
name 
; 
Description 
= 
description %
;% &
} 	
} 
}   �
aC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Data.Domain\User.cs
	namespace 	
Data
 
. 
Domain 
{ 
public 

class 
User 
{ 
private 
User 
( 
) 
{ 	
}

 	
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
public
string
Name
{
get
;
private
set
;
}
public 
bool 
IsAdmin 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
string 
Password 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
public 
string 
Token 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
string 
Description !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
static 
User 
Create !
(! "
string" (
name) -
,- .
bool/ 3
isAdmin4 ;
,; <
string= C
passwordD L
,L M
stringN T
tokenU Z
,Z [
string\ b
descriptionc n
)n o
{ 	
var 
instance 
= 
new 
User #
{$ %
Id% '
=( )
Guid* .
.. /
NewGuid/ 6
(6 7
)7 8
,8 9
	CreatedAt: C
=D E
DateTimeF N
.N O
NowO R
}R S
;S T
instance 
. 
Update 
( 
name  
,  !
isAdmin" )
,) *
password+ 3
,3 4
token5 :
,: ;
description< G
)G H
;H I
return 
instance 
; 
} 	
public 
void 
Update 
( 
string !
name" &
,& '
bool( ,
isAdmin- 4
,4 5
string6 <
password= E
,E F
stringG M
tokenN S
,S T
stringU [
description\ g
)g h
{ 	
Name 
= 
name 
; 
IsAdmin 
= 
isAdmin 
; 
Password 
= 
password 
;  
Token   
=   
token   
;   
Description!! 
=!! 
description!! %
;!!% &
}"" 	
}## 
}$$ 