�
kC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Entities\Filter.cs
	namespace 	
Data
 
. 
Domain 
. 
Entities 
{ 
public 

class 
Filter 
{ 
public 
KitchenType 
Cuisine "
{# $
get% (
;( )
set* -
;- .
}/ 0
public		 
double		 
Cost		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
double 
Rating 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
VotesNumber 
{  
get! $
;$ %
set& )
;) *
}+ ,
public
int
PreparationTime
{
get
;
set
;
}
public 
List 
< 

Ingredient 
> 
IncludedIngredients  3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
List 
< 

Ingredient 
> 
OnlyIngredients  /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
List 
< 

Ingredient 
> 
ExcludedIngredients  3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
Filter 
( 
) 
{ 	
IncludedIngredients 
=  !
new" %
List& *
<* +

Ingredient+ 5
>5 6
(6 7
)7 8
;8 9
OnlyIngredients 
= 
new !
List" &
<& '

Ingredient' 1
>1 2
(2 3
)3 4
;4 5
ExcludedIngredients 
=  !
new" %
List& *
<* +

Ingredient+ 5
>5 6
(6 7
)7 8
;8 9
Cuisine 
= 
KitchenType !
.! "
Unspecified" -
;- .
Cost 
= 
$num 
; 
Name 
= 
$str 
; 
Rating 
= 
$num 
; 
VotesNumber 
= 
$num 
; 
PreparationTime 
= 
$num 
;  
} 	
}   
}!! �
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
} �)
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

enum 
RecipeStatusType  
:! "
byte# '
{ 
Approved 
, 
Waiting 
, 
Rejected		 
}

 
public 

enum 
KitchenType 
: 
byte "
{ 
Unspecified
,
Vegan 
,

Vegetarian 
, 
European 
, 
Asian 
,
Chinese 
, 
Japanese 
, 
Mexican 
, 
Italian 
, 
Russian 
, 
French 
} 
public 

class 
Recipe 
{ 
private 
Recipe 
( 
) 
{ 	
} 	
public!! 
Guid!! 
Id!! 
{!! 
get!! 
;!! 
private!! %
set!!& )
;!!) *
}!!+ ,
public"" 
Guid"" 
UserId"" 
{"" 
get""  
;""  !
private""" )
set""* -
;""- .
}""/ 0
public$$ 
string$$ 
Name$$ 
{$$ 
get$$  
;$$  !
set$$" %
;$$% &
}$$' (
public%% 
string%% 
Content%% 
{%% 
get%%  #
;%%# $
set%%& )
;%%) *
}%%+ ,
public&& 
RecipeStatusType&& 
Status&&  &
{&&' (
get&&) ,
;&&, -
set&&. 1
;&&1 2
}&&3 4
public'' 
KitchenType'' 
Cuisine'' "
{''# $
get''% (
;''( )
set''* -
;''- .
}''/ 0
public)) 
double)) 
Cost)) 
{)) 
get))  
;))  !
set))# &
;))& '
}))( )
public** 
double** 
Rating** 
{** 
get** "
;**" #
set**$ '
;**' (
}**) *
public,, 
int,, 
VotesNumber,, 
{,,  
get,,! $
;,,$ %
set,,& )
;,,) *
},,+ ,
public-- 
int-- 
NrPeopleQuantity-- #
{--$ %
get--& )
;--) *
set--+ .
;--. /
}--0 1
public.. 
int.. 
PreparationTime.. "
{..# $
get..% (
;..( )
set..* -
;..- .
}../ 0
public11 
static11 
Recipe11 
Create11 #
(11# $
Guid11$ (
userId11) /
,11/ 0
string111 7
name118 <
,11< =
string11> D
content11E L
,11L M
RecipeStatusType11N ^
status11_ e
,11e f
int11g j
preparationTime11k z
,11z {
int22 

,22 
KitchenType22 *
cuisine22+ 2
)222 3
{33 	
var44 
instance44 
=44 
new44 
Recipe44 %
{44& '
Id44( *
=44+ ,
Guid44- 1
.441 2
NewGuid442 9
(449 :
)44: ;
,44; <
UserId44= C
=44D E
userId44F L
}44M N
;44N O
instance55 
.55 
Update55 
(55 
name55  
,55  !
content55" )
,55) *
preparationTime55+ :
,55: ;
status55< B
,55B C
cuisine55D K
,55K L

)55Z [
;55[ \
return66 
instance66 
;66 
}77 	
public99 
void99 
Update99 
(99 
string99 !
name99" &
,99& '
string99( .
content99/ 6
,996 7
int998 ;
preparationTime99< K
,99K L
RecipeStatusType99M ]
status99^ d
,99d e
KitchenType99f q
cuisine99r y
,99y z
int99{ ~
nrPeopleQuantity	99 �
)
99� �
{:: 	
Content;; 
=;; 
content;; 
;;; 
PreparationTime<< 
=<< 
preparationTime<< -
;<<- .
Name== 
=== 
name== 
;== 
Cuisine>> 
=>> 
cuisine>> 
;>> 
NrPeopleQuantity?? 
=?? 
nrPeopleQuantity?? /
;??/ 0
Cost@@ 
=@@ 
$num@@ 
;@@ 
StatusAA 
=AA 
statusAA 
;AA 
RatingBB 
=BB 
$numBB 
;BB 
VotesNumberCC 
=CC 
$numCC 
;CC 
}DD 	
}EE 
}FF �
tC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Entities\Food\RecipePost.cs
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

RecipePost 
: 
Post "
{ 
private 

RecipePost 
( 
) 
{ 	
}

 	
public 
Guid 
RecipeId 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
static 

RecipePost  
Create! '
(' (
string( .
content/ 6
,6 7
Guid8 <
recipeId= E
)E F
{ 	
var 
instance 
= 
new 

RecipePost )
{* +
RecipeId, 4
=5 6
recipeId7 ?
}@ A
;A B
instance 
. 
Update 
( 
content #
)# $
;$ %
return 
instance 
; 
} 	
public 
void 
Update 
( 
string !
content" )
)) *
{ 	
Content 
= 
content 
; 
} 	
} 
} �
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
=- .
Guid/ 3
.3 4
NewGuid4 ;
(; <
)< =
,= >
	CreatedAt? H
=I J
DateTimeK S
.S T
NowT W
}X Y
;Y Z
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
} �
tC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Entities\Forum\ForumPost.cs
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
class 
	ForumPost 
: 
Post !
{ 
private 
	ForumPost 
( 
) 
{ 	
}

 	
public 
Guid 
ThreadId 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
static 
	ForumPost 
Create  &
(& '
string' -
content. 5
,5 6
Guid7 ;
threadId< D
,D E
GuidF J
userIdK Q
)Q R
{ 	
var 
instance 
= 
new 
	ForumPost (
{) *
ThreadId+ 3
=4 5
threadId6 >
,> ?
UserId@ F
=G H
userIdI O
}P Q
;Q R
instance 
. 
Update 
( 
content #
)# $
;$ %
return 
instance 
; 
} 	
public 
void 
Update 
( 
string !
content" )
)) *
{ 	
Content 
= 
content 
; 
} 	
} 
} �
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
=+ ,
Guid- 1
.1 2
NewGuid2 9
(9 :
): ;
,; <
	CreatedAt= F
=G H
DateTimeI Q
.Q R
NowR U
,U V
UserIdW ]
=^ _
userId` f
,f g

CategoryIdh r
=s t

categoryIdu 
}
� �
;
� �
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
iC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Entities\Post.cs
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
Post 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
public

 
string

 
Content

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public
Post
(
string
content
)
{ 	
Id 
= 
Guid 
. 
NewGuid 
( 
) 
;  
	CreatedAt 
= 
DateTime  
.  !
Now! $
;$ %
Content 
= 
content 
; 
} 	
public 
Post 
( 
) 
{ 	
Id 
= 
Guid 
. 
NewGuid 
( 
) 
;  
	CreatedAt 
= 
DateTime  
.  !
Now! $
;$ %
} 	
} 
} �
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
}&& �
~C:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IForumCategoryRepository.cs
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
	interface $
IForumCategoryRepository -
:. /
IGenericRepository0 B
<B C
CategoryC K
>K L
{ 
} 
}		 �
|C:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IForumThreadRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public		 

	interface		 "
IForumThreadRepository		 +
:		, -
IGenericRepository		. @
<		@ A
Thread		A G
>		G H
{

 
Task 
< 
IEnumerable
< 
Thread 
>  
>  !
GetByCategoryId" 1
(1 2
Guid2 6
id7 9
)9 :
;: ;
} 
}

wC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IFridgeRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface 
IFridgeRepository &
:' (
IGenericRepository) ;
<; <
PairItem< D
>D E
{		 
Task

 
Delete


(

 
Guid

 
ingredientId

 %
,

% &
Guid

' +
recipeId

, 4
)

4 5
;

5 6
Task 
< 
PairItem
> 
Get 
( 
Guid 
ingredientId  ,
,, -
Guid. 2
recipeId3 ;
); <
;< =
Task 
< 
IEnumerable
< 
PairItem !
>! "
>" #
GetByRecipe$ /
(/ 0
Guid0 4
recipeId5 =
)= >
;> ?
Task
<
IEnumerable
<
PairItem
>
>
GetByIngredient
(
Guid
ingredientId
)
;
} 
} �	
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
} �
�C:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IIngredientsCategoryRepository.cs
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
	interface *
IIngredientsCategoryRepository 3
:4 5
IGenericRepository6 H
<H I
IngredientCategoryI [
>[ \
{ 
Task		 
<		 
bool		
>		 
Exists		 
(		 
String		  
name		! %
)		% &
;		& '
Task

 
<

 
IngredientCategory


>

  
	GetByName

! *
(

* +
string

+ 1
name

2 6
)

6 7
;

7 8
} 
} �
|C:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IIngredientsRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public 

	interface "
IIngredientsRepository +
:, -
IGenericRepository. @
<@ A

IngredientA K
>K L
{		 
Task

 
AddIngredientCustom


(

  !
Guid

! %
recipeId

& .
,

. /
string

0 6
categoryName

7 C
,

C D
string

E K
measureUnit

L W
,

W X
string

Y _
name

` d
,

d e
double 
quantity 
, 
double #
cost$ (
,( )
double* 0
weight1 7
)7 8
;8 9
Task 
< 
IEnumerable
< 

Ingredient #
># $
>$ %
	GetByName& /
(/ 0
string0 6
name7 ;
); <
;< =
Task
<

Ingredient
>
GetByNameAndMeasure
(
String
name
,
String
measureUnit
)
;
} 
} �!
xC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Data.Domain\Intefaces\IRecipesRepository.cs
	namespace 	
Data
 
. 
Domain 
. 
	Intefaces 
{ 
public		 

	interface		 
IRecipesRepository		 '
:		( )
IGenericRepository		* <
<		< =
Recipe		= C
>		C D
{

 
Task 
< 
Double
> 
GetCostById  
(  !
Guid! %
id& (
)( )
;) *
Task 
UpdateAllCosts
( 
) 
; 
Task
<
IEnumerable
<
Recipe
>
>
GetByKitchenType
(
KitchenType
cuisine
,
Task
<
IEnumerable
<
Recipe
>
>
recipes
)
;
Task 
< 
IEnumerable
< 
Recipe 
>  
>  !
	GetByCost" +
(+ ,
Double, 2
cost3 7
,7 8
Task9 =
<= >
IEnumerable> I
<I J
RecipeJ P
>P Q
>Q R
recipesS Z
)Z [
;[ \
Task 
< 
IEnumerable
< 
Recipe 
>  
>  !
	GetByName" +
(+ ,
String, 2
name3 7
,7 8
Task9 =
<= >
IEnumerable> I
<I J
RecipeJ P
>P Q
>Q R
recipesS Z
)Z [
;[ \
Task 
< 
IEnumerable
< 
Recipe 
>  
>  !
GetByRating" -
(- .
Double. 4
rating5 ;
,; <
Task= A
<A B
IEnumerableB M
<M N
RecipeN T
>T U
>U V
recipesW ^
)^ _
;_ `
Task 
< 
IEnumerable
< 
Recipe 
>  
>  !
GetByVotesNumber" 2
(2 3
int3 6
votes7 <
,< =
Task> B
<B C
IEnumerableC N
<N O
RecipeO U
>U V
>V W
recipesX _
)_ `
;` a
Task 
< 
IEnumerable
< 
Recipe 
>  
>  ! 
GetByPrepatationTime" 6
(6 7
int7 :
minutes; B
,B C
TaskD H
<H I
IEnumerableI T
<T U
RecipeU [
>[ \
>\ ]
recipes^ e
)e f
;f g
Task 
< 
IEnumerable
< 
Recipe 
>  
>  !
GetByIngredients" 2
(2 3
List3 7
<7 8

Ingredient8 B
>B C
includedD L
,L M
ListN R
<R S

IngredientS ]
>] ^
excluded_ g
,g h
Task 
< 
IEnumerable 
< 
Recipe #
># $
>$ %
recipes& -
)- .
;. /
Task 
< 
IEnumerable
< 
Recipe 
>  
>  ! 
GetByOnlyIngredients" 6
(6 7
List7 ;
<; <

Ingredient< F
>F G
ingredientsH S
,S T
TaskU Y
<Y Z
IEnumerableZ e
<e f
Recipef l
>l m
>m n
recipeso v
)v w
;w x
Task 
< 
IEnumerable
< 
Recipe 
>  
>  !
GetByFilter" -
(- .
Filter. 4
filter5 ;
); <
;< =
} 
} �
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
+ ,
Task 
< 
User
> 
	GetByName 
( 
string #
userName$ ,
), -
;- .
} 
}