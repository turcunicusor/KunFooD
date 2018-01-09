�
tC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Entities\Food\Ingredient.cs
	namespace 	
Data
 
. 
Domain 
. 
Entities 
. 
Food #
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
|C:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Entities\Food\IngredientCategory.cs
	namespace 	
Data
 
. 
Domain 
. 
Entities 
. 
Food #
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
} �
rC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Entities\Food\PairItem.cs
	namespace 	
Data
 
. 
Domain 
. 
Entities 
. 
Food #
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
} �
pC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Entities\Food\Recipe.cs
	namespace 	
Data
 
. 
Domain 
. 
Entities 
. 
Food #
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
}(( �
sC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Entities\Forum\Category.cs
	namespace 	
Data
 
. 
Domain 
. 
Entities 
. 
Forum $
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
return 
instance 
; 
} 	
public 
void 
Update 
( 
string !
name" &
,& '
string( .
description/ :
): ;
{ 	
Name 
= 
name 
; 
Description 
= 
description %
;% &
} 	
} 
} �
oC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Entities\Forum\Post.cs
	namespace 	
Data
 
. 
Domain 
. 
Entities 
. 
Forum $
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
return 
instance 
; 
} 	
public 
void 
Update 
( 
string !
content" )
)) *
{ 	
Content 
= 
content 
; 
} 	
} 
} �
qC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Entities\Forum\Thread.cs
	namespace 	
Data
 
. 
Domain 
. 
Entities 
. 
Forum $
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
;} ~
instance 
. 
Update 
( 
name  
,  !
description" -
)- .
;. /
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
}   �
iC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Entities\User.cs
	namespace 	
Data
 
. 
Domain 
. 
Entities 
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
UserName
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
string 
Email 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
string 
Password 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
public 
string 
Token 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
string 
Description !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
static 
User 
Create !
(! "
string" (
name) -
,- .
bool/ 3
isAdmin4 ;
,; <
string< B
emailC H
,H I
stringJ P
passwordQ Y
,Y Z
string[ a
tokenb g
,g h
stringi o
descriptionp {
){ |
{ 	
var 
instance 
= 
new 
User #
{$ %
Id% '
=( )
Guid* .
.. /
NewGuid/ 6
(6 7
)7 8
,8 9
	CreatedAt: C
=D E
DateTimeF N
.N O
NowO R
}R S
;S T
instance 
. 
Update 
( 
name  
,  !
isAdmin" )
,) *
email+ 0
,0 1
password2 :
,: ;
token< A
,A B
descriptionC N
)N O
;O P
return 
instance 
; 
} 	
public 
void 
Update 
( 
string !
name" &
,& '
bool( ,
isAdmin- 4
,4 5
string5 ;
email< A
,A B
stringC I
passwordJ R
,R S
stringT Z
token[ `
,` a
stringb h
descriptioni t
)t u
{ 	
UserName 
= 
name 
; 
IsAdmin 
= 
isAdmin 
; 
Email   
=   
email   
;   
Password!! 
=!! 
password!! 
;!!  
Token"" 
="" 
token"" 
;"" 
Description## 
=## 
description## %
;##% &
}$$ 	
}%% 
}&& �
wC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IFridgeRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface 
IFridgeRepository &
:' (
IGenericRepository) ;
<; <
PairItem< D
>D E
{ 
Task		 
Delete		
(		 
Guid		 
ingredientId		 %
,		% &
Guid		' +
recipeId		, 4
)		4 5
;		5 6
Task

 
<

 
PairItem


>

 
Get

 
(

 
Guid

 
ingredientId

  ,
,

, -
Guid

. 2
recipeId

3 ;
)

; <
;

< =
} 
} �	
xC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IGenericRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface 
IGenericRepository '
<' (
T( )
>) *
where+ 0
T1 2
:3 4
class5 :
{ 
Task		 
<		 
IEnumerable		
<		 
T		 
>		 
>		 
GetAll		 #
(		# $
)		$ %
;		% &
Task

 
<

 
T


>

 
FindById

 
(

 
Guid

 
id

  
)

  !
;

! "
Task 
Add
( 
T 
entity 
) 
; 
Task 
Delete
( 
Guid 
id 
) 
; 
Task
Edit
(
T
entity
)
;
Task 
Save
( 
) 
; 
} 
} �
�C:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IIngredientsCategoryRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface *
IIngredientsCategoryRepository 3
:4 5
IGenericRepository6 H
<H I
IngredientCategoryI [
>[ \
{ 
} 
} �
|C:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IIngredientsRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface "
IIngredientsRepository +
:, -
IGenericRepository. @
<@ A

IngredientA K
>K L
{ 
} 
} �
xC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IRecipesRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface 
IRecipesRepository '
:( )
IGenericRepository* <
<< =
Recipe= C
>C D
{ 
} 
} �
vC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IUsersRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface 
IUsersRepository %
:& '
IGenericRepository( :
<: ;
User; ?
>? @
{ 
Task		 
<		 
IEnumerable		
<		 
User		 
>		 
>		 
	GetAdmins		  )
(		) *
)		* +
;		+ ,
Task

 
<

 
User


>

 

GetByEmail

 
(

 
string

 $
email

% *
)

* +
;

+ ,
} 
} 