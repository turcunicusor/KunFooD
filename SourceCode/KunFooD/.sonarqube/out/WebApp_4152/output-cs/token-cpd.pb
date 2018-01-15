Ú
wC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Controllers\AdminPanelController.cs
	namespace 	
WebApp
 
. 
Controllers 
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ #
DefaultControllerFilter 
] 
public 

class  
AdminPanelController %
:& '

Controller( 2
{ 
private 
readonly $
IForumCategoryRepository 1
_categoryRepo2 ?
;? @
public  
AdminPanelController #
(# $$
IForumCategoryRepository$ <
categoryRepo= I
)I J
{ 	
_categoryRepo 
= 
categoryRepo (
;( )
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Index) .
(. /
)/ 0
{ 	
return 
View 
( 
await 
_categoryRepo +
.+ ,
GetAll, 2
(2 3
)3 4
)4 5
;5 6
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
DeleteCategory) 7
(7 8
Guid8 <
id= ?
)? @
{ 	
await 
_categoryRepo 
.  
Delete  &
(& '
id' )
)) *
;* +
await 
_categoryRepo 
.  
Save  $
($ %
)% &
;& '
return   
RedirectToAction   #
(  # $
$str  $ +
)  + ,
;  , -
}!! 	
[## 	
HttpGet##	 
(## 
$str## 
)## 
]## 
public$$ 
IActionResult$$ 
CreateCategory$$ +
($$+ ,
)$$, -
{%% 	
return&& 
View&& 
(&& 
)&& 
;&& 
}'' 	
[)) 	
HttpPost))	 
()) 
$str)) 
))) 
])) 
public** 
async** 
Task** 
<** 
IActionResult** '
>**' (
CreateCategory**) 7
(**7 8
CreateCategoryDTO**8 I
dto**J M
)**M N
{++ 	
var,, 
category,, 
=,, 
Data,, 
.,,  
Domain,,  &
.,,& '
Entities,,' /
.,,/ 0
Forum,,0 5
.,,5 6
Category,,6 >
.,,> ?
Create,,? E
(,,E F
dto,,F I
.,,I J
Name,,J N
,,,N O
dto,,P S
.,,S T
Description,,T _
),,_ `
;,,` a
await-- 
_categoryRepo-- 
.--  
Add--  #
(--# $
category--$ ,
)--, -
;--- .
await.. 
_categoryRepo.. 
...  
Save..  $
(..$ %
)..% &
;..& '
return00 
RedirectToAction00 #
(00# $
$str00$ +
,00+ ,
$str00- 9
)009 :
;00: ;
}11 	
}22 
}33 ﬁ>
rC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Controllers\ForumController.cs
	namespace

 	
WebApp


 
.

 
Controllers

 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ #
DefaultControllerFilter 
] 
public 

class 
ForumController  
:! "

Controller# -
{ 
private 
readonly $
IForumCategoryRepository 1
_categoryRepo2 ?
;? @
private 
readonly "
IForumThreadRepository /
_threadRepo0 ;
;; <
private 
readonly 
IUsersRepository )
	_userRepo* 3
;3 4
public 
ForumController 
( $
IForumCategoryRepository 7
categoryRepo8 D
,D E"
IForumThreadRepositoryF \

threadRepo] g
,g h
IUsersRepository 
userRepo %
)% &
{ 	
_categoryRepo 
= 
categoryRepo (
;( )
_threadRepo 
= 

threadRepo $
;$ %
	_userRepo 
= 
userRepo  
;  !
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Index) .
(. /
)/ 0
{ 	
return 
View 
( 
await 
_categoryRepo +
.+ ,
GetAll, 2
(2 3
)3 4
)4 5
;5 6
}   	
["" 	
HttpGet""	 
("" 
$str"" 
)"" 
]"" 
public## 
async## 
Task## 
<## 
IActionResult## '
>##' (
Category##) 1
(##1 2
Guid##2 6
id##7 9
)##9 :
{$$ 	
var%% 
category%% 
=%% 
await%%  
_categoryRepo%%! .
.%%. /
FindById%%/ 7
(%%7 8
id%%8 :
)%%: ;
;%%; <
CategoryDTO'' 
dto'' 
='' 
new'' !
CategoryDTO''" -
(''- .
)''. /
;''/ 0
dto(( 
.(( 
Category(( 
=(( 
category(( #
;((# $
var** 
threads** 
=** 
await** 
_threadRepo**  +
.**+ ,
GetByCategoryId**, ;
(**; <
id**< >
)**> ?
;**? @
List++ 
<++ 
	ThreadDTO++ 
>++ 
threadDtoList++ )
=++* +
new++, /
List++0 4
<++4 5
	ThreadDTO++5 >
>++> ?
(++? @
)++@ A
;++A B
foreach-- 
(-- 
var-- 
thread-- 
in--  "
threads--# *
)--* +
{.. 
	ThreadDTO// 
	threadDto// #
=//$ %
new//& )
	ThreadDTO//* 3
(//3 4
)//4 5
;//5 6
	threadDto00 
.00 
Id00 
=00 
thread00 %
.00% &
Id00& (
;00( )
	threadDto11 
.11 
Name11 
=11  
thread11! '
.11' (
Name11( ,
;11, -
	threadDto22 
.22 
Description22 %
=22& '
thread22( .
.22. /
Description22/ :
;22: ;
	threadDto33 
.33 
	CreatedAt33 #
=33$ %
thread33& ,
.33, -
	CreatedAt33- 6
;336 7
	threadDto44 
.44 

AuthorName44 $
=44% &
await44' ,
GetThreadAuthorName44- @
(44@ A
thread44A G
.44G H
UserId44H N
)44N O
;44O P
threadDtoList55 
.55 
Add55 !
(55! "
	threadDto55" +
)55+ ,
;55, -
}66 
dto88 
.88 
Threads88 
=88 
threadDtoList88 '
;88' (
return99 
View99 
(99 
dto99 
)99 
;99 
}:: 	
[<< 	
HttpGet<<	 
(<< 
$str<< 
)<< 
]<< 
public== 
IActionResult== 
CreateThread== )
(==) *
Guid==* .
id==/ 1
)==1 2
{>> 	
CreateThreadDTO?? 
dto?? 
=??  !
new??" %
CreateThreadDTO??& 5
(??5 6
)??6 7
;??7 8
dto@@ 
.@@ 

CategoryId@@ 
=@@ 
id@@ 
;@@  
returnBB 
ViewBB 
(BB 
dtoBB 
)BB 
;BB 
}CC 	
[EE 	
HttpPostEE	 
(EE 
$strEE 
)EE 
]EE 
publicFF 
asyncFF 
TaskFF 
<FF 
IActionResultFF '
>FF' (
CreateThreadFF) 5
(FF5 6
CreateThreadDTOFF6 E
dtoFFF I
)FFI J
{GG 	
varLL 
threadLL 
=LL 
DataLL !
.LL! "
DomainLL" (
.LL( )
EntitiesLL) 1
.LL1 2
ForumLL2 7
.LL7 8
ThreadLL8 >
.LL> ?
CreateLL? E
(LLE F
dtoLLF I
.LLI J
NameLLJ N
,LLN O
dtoLLP S
.LLS T
DescriptionLLT _
,LL_ `
newLLa d
GuidLLe i
(LLi j
HttpContextLLj u
.LLu v
SessionLLv }
.LL} ~
	GetString	LL~ á
(
LLá à
$str
LLà ë
)
LLë í
)
LLí ì
,
LLì î
dto
LLï ò
.
LLò ô

CategoryId
LLô £
)
LL£ §
;
LL§ •
awaitMM 
_threadRepoMM !
.MM! "
AddMM" %
(MM% &
threadMM& ,
)MM, -
;MM- .
awaitNN 
_threadRepoNN !
.NN! "
SaveNN" &
(NN& '
)NN' (
;NN( )
returnPP 
RedirectToActionPP '
(PP' (
$strPP( 2
,PP2 3
$strPP4 ;
,PP; <
newPP= @
{PPA B
idPPC E
=PPF G
dtoPPH K
.PPK L

CategoryIdPPL V
}PPW X
)PPX Y
;PPY Z
returnUU 
ViewUU 
(UU 
dtoUU 
)UU 
;UU 
}VV 	
[XX 	
HttpGetXX	 
(XX 
$strXX 
)XX 
]XX 
publicYY 
asyncYY 
TaskYY 
<YY 
IActionResultYY '
>YY' (
ThreadYY) /
(YY/ 0
GuidYY0 4
idYY5 7
)YY7 8
{ZZ 	
var[[ 
thread[[ 
=[[ 
await[[ 
_threadRepo[[ *
.[[* +
FindById[[+ 3
([[3 4
id[[4 6
)[[6 7
;[[7 8
return]] 
View]] 
(]] 
thread]] 
)]] 
;]]  
}^^ 	
private`` 
async`` 
Task`` 
<`` 
string`` !
>``! "
GetThreadAuthorName``# 6
(``6 7
Guid``7 ;
id``< >
)``> ?
{aa 	
varbb 
userbb 
=bb 
awaitbb 
	_userRepobb &
.bb& '
FindByIdbb' /
(bb/ 0
idbb0 2
)bb2 3
;bb3 4
returncc 
usercc 
.cc 
UserNamecc  
;cc  !
}dd 	
}ee 
}ff ¯

qC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Controllers\HomeController.cs
	namespace 	
WebApp
 
. 
Controllers 
{ 
[ #
DefaultControllerFilter 
] 
public		 

class		 
HomeController		 
:		  !

Controller		" ,
{

 
public 
IActionResult 
Index "
(" #
)# $
{ 	
ViewBag 
. 
LoggedIn 
= 
false $
;$ %
return 
View 
( 
) 
; 
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
IActionResult 
Error "
(" #
)# $
{ 	
return 
View 
( 
new 
ErrorViewModel *
{+ ,
	RequestId- 6
=7 8
Activity9 A
.A B
CurrentB I
?I J
.J K
IdK M
??N P
HttpContextQ \
.\ ]
TraceIdentifier] l
}m n
)n o
;o p
} 	
} 
} •
C:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Controllers\IngredientCategoryController.cs
	namespace		 	
WebApp		
 
.		 
Controllers		 
{

 
[ 
Route 

(
 
$str 
) 
] 
[ #
DefaultControllerFilter 
] 
public 

class (
IngredientCategoryController -
:. /

Controller0 :
{ 
private 
readonly *
IIngredientsCategoryRepository 7*
_ingredientsCategoryRepository8 V
;V W
public (
IngredientCategoryController +
(+ ,*
IIngredientsCategoryRepository, J)
ingredientsCategoryRepositoryK h
)h i
{ 	*
_ingredientsCategoryRepository *
=+ ,)
ingredientsCategoryRepository- J
;J K
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
)0 1
{ 	
return 
Ok 
( 
await *
_ingredientsCategoryRepository :
.: ;
GetAll; A
(A B
)B C
)C D
;D E
} 	
} 
} Î
xC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Controllers\IngredientsController.cs
	namespace		 	
WebApp		
 
.		 
Controllers		 
{

 
[ 
Route 

(
 
$str 
) 
] 
[ #
DefaultControllerFilter 
] 
public 

class !
IngredientsController &
:' (

Controller) 3
{ 
private 
readonly "
IIngredientsRepository /"
_ingredientsRepository0 F
;F G
private 
readonly 
IFridgeRepository *
_fridgeRepository+ <
;< =
public !
IngredientsController $
($ %"
IIngredientsRepository% ;!
ingredientsRepository< Q
,Q R
IFridgeRepositoryS d
fridgeRepositorye u
)u v
{ 	"
_ingredientsRepository "
=# $!
ingredientsRepository% :
;: ;
_fridgeRepository 
= 
fridgeRepository  0
;0 1
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
)0 1
{ 	
return 
Ok 
( 
await "
_ingredientsRepository 2
.2 3
GetAll3 9
(9 :
): ;
); <
;< =
} 	
[ 	
HttpGet	 
] 
public   
async   
Task   
<   
IActionResult   '
>  ' (
Get  ) ,
(  , -
string  - 3
name  4 8
)  8 9
{!! 	
return"" 
Ok"" 
("" 
await"" "
_ingredientsRepository"" 2
.""2 3
	GetByName""3 <
(""< =
name""= A
)""A B
)""B C
;""C D
}## 	
[%% 	
HttpGet%%	 
]%% 
[&& 	
Route&&	 
(&& 
$str&& 
)&& 
]&& 
public'' 
async'' 
Task'' 
<'' 
IActionResult'' '
>''' (
GetAllByRecipe'') 7
(''7 8
Guid''8 <
recipeId''= E
)''E F
{(( 	
IEnumerable)) 
<)) 
PairItem))  
>))  !
p))" #
=))$ %
await))& +
_fridgeRepository)), =
.))= >
GetByRecipe))> I
())I J
recipeId))J R
)))R S
;))S T
List** 
<** 

Ingredient** 
>** 
ingredients** (
=**) *
new**+ .
List**/ 3
<**3 4

Ingredient**4 >
>**> ?
(**? @
)**@ A
;**A B
foreach++ 
(++ 
var++ 
item++ 
in++  
p++! "
)++" #
ingredients,, 
.,, 
Add,, 
(,,  
await,,  %"
_ingredientsRepository,,& <
.,,< =
FindById,,= E
(,,E F
item,,F J
.,,J K
IngredientId,,K W
),,W X
),,X Y
;,,Y Z
return-- 
Ok-- 
(-- 
ingredients-- !
)--! "
;--" #
}.. 	
}// 
}00 Ï(
rC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Controllers\LoginController.cs
	namespace 	
WebApp
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ #
DefaultControllerFilter 
] 
public 

class 
LoginController  
:! "

Controller# -
{ 
private 
readonly 
IUsersRepository )
_repository* 5
;5 6
public 
LoginController 
( 
IUsersRepository /

repository0 :
): ;
{ 	
_repository 
= 

repository $
;$ %
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Login "
(" #
)# $
{ 	
HttpContext 
. 
Request 
.  
Query  %
.% &
TryGetValue& 1
(1 2
$str2 >
,> ?
out@ C
varD G

registeredH R
)R S
;S T
if"" 
("" 

registered"" 
."" 
Equals"" !
(""! "
StringValues""" .
."". /
Empty""/ 4
)""4 5
)""5 6
ViewData## 
[## 
$str## %
]##% &
=##' (
$num##) *
;##* +
else$$ 
ViewData%% 
[%% 
$str%% %
]%%% &
=%%' (
int%%) ,
.%%, -
Parse%%- 2
(%%2 3

registered%%3 =
)%%= >
;%%> ?
return&& 
View&& 
(&& 
)&& 
;&& 
}'' 	
[)) 	
HttpPost))	 
])) 
public** 
async** 
Task** 
<** 
IActionResult** '
>**' (
Login**) .
(**. /
LoginDTO**/ 7
dto**8 ;
)**; <
{++ 	
User,, 
user,, 
=,, 
await,, 
_repository,, )
.,,) *

GetByEmail,,* 4
(,,4 5
dto,,5 8
.,,8 9
Email,,9 >
),,> ?
;,,? @
if// 
(// 
user// 
!=// 
null// 
)// 
{00 
byte22 
[22 
]22 
bytes22 
=22 
Encoding22 '
.22' (
UTF822( ,
.22, -
GetBytes22- 5
(225 6
dto226 9
.229 :
Password22: B
)22B C
;22C D
SHA256Managed33 
cipher33 $
=33% &
new33' *
SHA256Managed33+ 8
(338 9
)339 :
;33: ;
byte44 
[44 
]44 
hash44 
=44 
cipher44 $
.44$ %
ComputeHash44% 0
(440 1
bytes441 6
)446 7
;447 8
string55 
hashStr55 
=55  
$str55! #
;55# $
foreach66 
(66 
byte66 
b66 
in66  "
hash66# '
)66' (
hashStr77 
+=77 
string77 %
.77% &
Format77& ,
(77, -
$str77- 5
,775 6
b777 8
)778 9
;779 :
if:: 
(:: 
user:: 
.:: 
Password:: !
.::! "
Equals::" (
(::( )
hashStr::) 0
)::0 1
)::1 2
{;; 
var== 
token== 
=== 
JwtToken==  (
.==( )
GenerateToken==) 6
(==6 7
user==7 ;
)==; <
;==< =
Response@@ 
.@@ 
Cookies@@ $
.@@$ %
Append@@% +
(@@+ ,
$str@@, 7
,@@7 8
new@@9 <#
JwtSecurityTokenHandler@@= T
(@@T U
)@@U V
.@@V W

WriteToken@@W a
(@@a b
token@@b g
)@@g h
)@@h i
;@@i j
HttpContextBB 
.BB  
SessionBB  '
.BB' (
	SetStringBB( 1
(BB1 2
$strBB2 ;
,BB; <
userBB= A
.BBA B
IdBBB D
.BBD E
ToStringBBE M
(BBM N
)BBN O
)BBO P
;BBP Q
returnDD 
RedirectToActionDD +
(DD+ ,
$strDD, 3
,DD3 4
$strDD5 ;
)DD; <
;DD< =
}EE 

ModelStateFF 
.FF 
AddModelErrorFF (
(FF( )
$strFF) +
,FF+ ,
$strFF- @
)FF@ A
;FFA B
}GG 
elseHH 

ModelStateII 
.II 
AddModelErrorII (
(II( )
$strII) +
,II+ ,
$strII- I
)III J
;IIJ K
returnLL 
ViewLL 
(LL 
dtoLL 
)LL 
;LL 
}MM 	
}NN 
}OO ÛL
tC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Controllers\RecipesController.cs
	namespace

 	
WebApp


 
.

 
Controllers

 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ #
DefaultControllerFilter 
] 
public 

class 
RecipesController "
:# $

Controller% /
{ 
private 
readonly 
IRecipesRepository +
_recipesRepository, >
;> ?
private 
readonly "
IIngredientsRepository /"
_ingredientsRepository0 F
;F G
private 
readonly 
IUsersRepository )
_usersRepository* :
;: ;
public 
RecipesController  
(  !
IRecipesRepository! 3
recipesRepository4 E
,E F"
IIngredientsRepositoryG ]!
ingredientsRepository^ s
,s t
IUsersRepository	u Ö
usersRepository
Ü ï
)
ï ñ
{ 	
_recipesRepository 
=  
recipesRepository! 2
;2 3"
_ingredientsRepository "
=# $!
ingredientsRepository% :
;: ;
_usersRepository 
= 
usersRepository .
;. /
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Create) /
(/ 0
[0 1
FromBody1 9
]9 :
	RecipeDTO; D
	recipeDtoE N
)N O
{ 	
User 
	adminUser 
= 
await "
_usersRepository# 3
.3 4
	GetByName4 =
(= >
$str> E
)E F
;F G
var 
recipe 
= 
Recipe 
.  
Create  &
(& '
	adminUser' 0
.0 1
Id1 3
,3 4
	recipeDto5 >
.> ?
Name? C
,C D
	recipeDtoE N
.N O
ContentO V
,V W
RecipeStatusTypeX h
.h i
Approvedi q
,q r
	recipeDto   
.   
PreparationTime   )
,  ) *
	recipeDto  + 4
.  4 5
Servings  5 =
,  = >
KitchenType  ? J
.  J K
Unspecified  K V
)  V W
;  W X
await!! 
_recipesRepository!! $
.!!$ %
Add!!% (
(!!( )
recipe!!) /
)!!/ 0
;!!0 1
foreach"" 
("" 
var"" 

ingredient"" #
in""$ &
	recipeDto""' 0
.""0 1
Ingredients""1 <
)""< =
await## "
_ingredientsRepository## ,
.##, -
AddIngredientCustom##- @
(##@ A
recipe##A G
.##G H
Id##H J
,##J K

ingredient##L V
.##V W
Category##W _
,##_ `

ingredient##a k
.##k l
MeasurementUnit##l {
,##{ |

ingredient$$ 
.$$ 
Name$$ #
,$$# $

ingredient$$% /
.$$/ 0
Quantity$$0 8
,$$8 9

ingredient$$: D
.$$D E
Cost$$E I
,$$I J

ingredient$$K U
.$$U V
Weight$$V \
)$$\ ]
;$$] ^
return%% 
Ok%% 
(%% 
recipe%% 
)%% 
;%% 
}&& 	
[(( 	
HttpGet((	 
](( 
[)) 	
Route))	 
()) 
$str)) 
))) 
])) 
public** 
async** 
Task** 
<** 
IActionResult** '
>**' (
GetAll**) /
(**/ 0
)**0 1
{++ 	
await,, 
_recipesRepository,, $
.,,$ %
UpdateAllCosts,,% 3
(,,3 4
),,4 5
;,,5 6
return-- 
Ok-- 
(-- 
await-- 
_recipesRepository-- .
.--. /
GetAll--/ 5
(--5 6
)--6 7
)--7 8
;--8 9
}.. 	
[00 	
HttpGet00	 
]00 
public11 
async11 
Task11 
<11 
IActionResult11 '
>11' (
Get11) ,
(11, -
string11- 3
name114 8
)118 9
{22 	
return33 
Ok33 
(33 
await33 
_recipesRepository33 .
.33. /
	GetByName33/ 8
(338 9
name339 =
,33= >
_recipesRepository33? Q
.33Q R
GetAll33R X
(33X Y
)33Y Z
)33Z [
)33[ \
;33\ ]
}44 	
[66 	
HttpPost66	 
]66 
[77 	
Route77	 
(77 
$str77 
)77 
]77 
public88 
async88 
Task88 
<88 
IActionResult88 '
>88' (
FilterRecipes88) 6
(886 7
[887 8
FromBody888 @
]88@ A
	FilterDTO88B K
	filterDto88L U
)88U V
{99 	
if:: 
(:: 
(:: 
	filterDto:: 
.:: 
IncludedIngredients:: .
.::. /
Count::/ 4
!=::5 7
$num::8 9
||::: <
	filterDto::= F
.::F G
ExcludedIngredients::G Z
.::Z [
Count::[ `
!=::a c
$num::d e
)::e f
&&::g i
	filterDto;; 
.;; 
OnlyIngredients;; ,
.;;, -
Count;;- 2
!=;;3 5
$num;;6 7
);;7 8
return<< 

BadRequest<< !
(<<! "
$str<<" K
)<<K L
;<<L M
List== 
<== 

Ingredient== 
>== 
includedIngredients== 0
===1 2
new==3 6
List==7 ;
<==; <

Ingredient==< F
>==F G
(==G H
)==H I
;==I J
List>> 
<>> 

Ingredient>> 
>>> 
onlyIngredients>> ,
=>>- .
new>>/ 2
List>>3 7
<>>7 8

Ingredient>>8 B
>>>B C
(>>C D
)>>D E
;>>E F
List?? 
<?? 

Ingredient?? 
>?? 
excludedIngredients?? 0
=??1 2
new??3 6
List??7 ;
<??; <

Ingredient??< F
>??F G
(??G H
)??H I
;??I J
foreach@@ 
(@@ 
var@@ 
ing@@ 
in@@ 
	filterDto@@  )
.@@) *
IncludedIngredients@@* =
)@@= >
includedIngredientsAA #
.AA# $
AddAA$ '
(AA' (
awaitAA( -"
_ingredientsRepositoryAA. D
.AAD E
GetByNameAndMeasureAAE X
(AAX Y
ingAAY \
.AA\ ]
NameAA] a
,AAa b
ingAAc f
.AAf g
MeasurementUnitAAg v
)AAv w
)AAw x
;AAx y
foreachBB 
(BB 
varBB 
ingBB 
inBB 
	filterDtoBB  )
.BB) *
OnlyIngredientsBB* 9
)BB9 :
onlyIngredientsCC 
.CC  
AddCC  #
(CC# $
awaitCC$ )"
_ingredientsRepositoryCC* @
.CC@ A
GetByNameAndMeasureCCA T
(CCT U
ingCCU X
.CCX Y
NameCCY ]
,CC] ^
ingCC_ b
.CCb c
MeasurementUnitCCc r
)CCr s
)CCs t
;CCt u
foreachDD 
(DD 
varDD 
ingDD 
inDD 
	filterDtoDD  )
.DD) *
ExcludedIngredientsDD* =
)DD= >
excludedIngredientsEE #
.EE# $
AddEE$ '
(EE' (
awaitEE( -"
_ingredientsRepositoryEE. D
.EED E
GetByNameAndMeasureEEE X
(EEX Y
ingEEY \
.EE\ ]
NameEE] a
,EEa b
ingEEc f
.EEf g
MeasurementUnitEEg v
)EEv w
)EEw x
;EEx y
FilterFF 
filterFF 
=FF 
newFF 
FilterFF  &
{GG 
CostHH 
=HH 
	filterDtoHH  
.HH  !
CostHH! %
,HH% &
CuisineII 
=II 
	filterDtoII #
.II# $
CuisineII$ +
,II+ ,
ExcludedIngredientsJJ #
=JJ$ %
excludedIngredientsJJ& 9
,JJ9 :
IncludedIngredientsKK #
=KK$ %
includedIngredientsKK& 9
,KK9 :
NameLL 
=LL 
	filterDtoLL  
.LL  !
NameLL! %
,LL% &
OnlyIngredientsMM 
=MM  !
onlyIngredientsMM" 1
,MM1 2
PreparationTimeNN 
=NN  !
	filterDtoNN" +
.NN+ ,
PreparationTimeNN, ;
,NN; <
RatingOO 
=OO 
	filterDtoOO "
.OO" #
RatingOO# )
,OO) *
VotesNumberPP 
=PP 
	filterDtoPP '
.PP' (
VotesNumberPP( 3
}QQ 
;QQ 
returnRR 
OkRR 
(RR 
awaitRR 
_recipesRepositoryRR .
.RR. /
GetByFilterRR/ :
(RR: ;
filterRR; A
)RRA B
)RRB C
;RRC D
}SS 	
}TT 
}UU ®
uC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Controllers\RegisterController.cs
	namespace 	
WebApp
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ #
DefaultControllerFilter 
] 
public 

class 
RegisterController #
:$ %

Controller& 0
{ 
private 
readonly 
IUsersRepository )
_repository* 5
;5 6
public 
RegisterController !
(! "
IUsersRepository" 2

repository3 =
)= >
{ 	
_repository 
= 

repository $
;$ %
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
Register %
(% &
)& '
{ 	
return 
View 
( 
) 
; 
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Register) 1
(1 2
RegisterDTO2 =
dto> A
)A B
{   	
byte"" 
["" 
]"" 
bytes"" 
="" 
Encoding"" #
.""# $
UTF8""$ (
.""( )
GetBytes"") 1
(""1 2
dto""2 5
.""5 6
Password""6 >
)""> ?
;""? @
SHA256Managed## 
cipher##  
=##! "
new### &
SHA256Managed##' 4
(##4 5
)##5 6
;##6 7
byte$$ 
[$$ 
]$$ 
hash$$ 
=$$ 
cipher$$  
.$$  !
ComputeHash$$! ,
($$, -
bytes$$- 2
)$$2 3
;$$3 4
string%% 
hashStr%% 
=%% 
$str%% 
;%%  
foreach&& 
(&& 
byte&& 
b&& 
in&& 
hash&& #
)&&# $
hashStr'' 
+='' 
string'' !
.''! "
Format''" (
(''( )
$str'') 1
,''1 2
b''3 4
)''4 5
;''5 6
User** 
user** 
=** 
Data** 
.** 
Domain** #
.**# $
Entities**$ ,
.**, -
User**- 1
.**1 2
Create**2 8
(**8 9
dto**9 <
.**< =
UserName**= E
,**E F
false**G L
,**L M
dto**N Q
.**Q R
Email**R W
,**W X
hashStr**Y `
,**` a
null**b f
,**f g
$str**h r
)**r s
;**s t
await++ 
_repository++ 
.++ 
Add++ !
(++! "
user++" &
)++& '
;++' (
return.. 
RedirectToAction.. #
(..# $
$str..$ +
,..+ ,
new..- 0 
RouteValueDictionary..1 E
(..E F
new..F I
{..J K

controller..K U
=..V W
$str..X _
,.._ `

Registered..a k
=..l m
$num..n o
}..p q
)..q r
)..r s
;..s t
}// 	
}00 
}11 ø4
rC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Controllers\UsersController.cs
	namespace		 	
WebApp		
 
.		 
Controllers		 
{

 
[ 
Route 

(
 
$str 
) 
] 
[ #
DefaultControllerFilter 
] 
public 

class 
UsersController  
:! "

Controller# -
{ 
private 
readonly 
IUsersRepository )
_repository* 5
;5 6
public 
UsersController 
( 
IUsersRepository /

repository0 :
): ;
{ 	
_repository 
= 

repository $
;$ %
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Index) .
(. /
)/ 0
{ 	
return 
Ok 
( 
await 
_repository '
.' (
GetAll( .
(. /
)/ 0
)0 1
;1 2
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
	GetAdmins) 2
(2 3
)3 4
{   	
return!! 
Ok!! 
(!! 
await!! 
_repository!! '
.!!' (
	GetAdmins!!( 1
(!!1 2
)!!2 3
)!!3 4
;!!4 5
}"" 	
[$$ 	
HttpGet$$	 
]$$ 
[%% 	
Route%%	 
(%% 
$str%% 
)%% 
]%% 
public&& 
async&& 
Task&& 
<&& 
IActionResult&& '
>&&' (
GetById&&) 0
(&&0 1
Guid&&1 5
id&&6 8
)&&8 9
{'' 	
var(( 
user(( 
=(( 
await(( 
_repository(( (
.((( )
FindById(() 1
(((1 2
id((2 4
)((4 5
;((5 6
if)) 
()) 
user)) 
==)) 
null)) 
))) 
{** 
return++ 
NotFound++ 
(++  
)++  !
;++! "
},, 
return-- 
Ok-- 
(-- 
user-- 
)-- 
;-- 
}.. 	
[00 	
HttpPost00	 
]00 
public11 
IActionResult11 
Create11 #
(11# $
[11$ %
FromBody11% -
]11- .
CreateUsers11/ :
usrToCreate11; F
)11F G
{22 	
User33 
user33 
=33 
Data33 
.33 
Domain33 #
.33# $
Entities33$ ,
.33, -
User33- 1
.331 2
Create332 8
(338 9
usrToCreate339 D
.33D E
Name33E I
,33I J
usrToCreate33K V
.33V W
IsAdmin33W ^
,33^ _
usrToCreate33` k
.33k l
Email33l q
,33q r
usrToCreate33s ~
.33~ 
Password	33 á
,
33á à
usrToCreate
33â î
.
33î ï
Token
33ï ö
,
33ö õ
usrToCreate
33ú ß
.
33ß ®
Description
33® ≥
)
33≥ ¥
;
33¥ µ
_repository44 
.44 
Add44 
(44 
user44  
)44  !
;44! "
return55 
Ok55 
(55 
user55 
)55 
;55 
}66 	
[88 	
HttpPut88	 
]88 
[99 	
Route99	 
(99 
$str99 
)99 
]99 
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
Update::) /
(::/ 0
Guid::0 4
id::5 7
,::7 8
[::9 :
FromBody::: B
]::B C
UpdateUsers::C N
userToUpdate::O [
)::[ \
{;; 	
if<< 
(<< 
id<< 
!=<< 
userToUpdate<< "
.<<" #
Id<<# %
)<<% &
{== 
return>> 
NotFound>> 
(>>  
)>>  !
;>>! "
}?? 
var@@ 
user@@ 
=@@ 
await@@ 
_repository@@ (
.@@( )
FindById@@) 1
(@@1 2
id@@2 4
)@@4 5
;@@5 6
userAA 
.AA 
UpdateAA 
(AA 
userToUpdateAA $
.AA$ %
NameAA% )
,AA) *
userToUpdateAA+ 7
.AA7 8
IsAdminAA8 ?
,AA? @
userToUpdateAAA M
.AAM N
EmailAAN S
,AAS T
userToUpdateAAU a
.AAa b
PasswordAAb j
,AAj k
userToUpdateAAl x
.AAx y
TokenAAy ~
,AA~ 
userToUpdate
AAÄ å
.
AAå ç
Description
AAç ò
)
AAò ô
;
AAô ö
awaitBB 
_repositoryBB 
.BB 
EditBB "
(BB" #
userBB# '
)BB' (
;BB( )
returnCC 
OkCC 
(CC 
userCC 
)CC 
;CC 
}DD 	
[FF 	

HttpDeleteFF	 
]FF 
publicGG 
asyncGG 
TaskGG 
<GG 
IActionResultGG '
>GG' (
DeleteGG) /
(GG/ 0
GuidGG0 4
idGG5 7
)GG7 8
{HH 	
varII 
userII 
=II 
awaitII 
_repositoryII (
.II( )
FindByIdII) 1
(II1 2
idII2 4
)II4 5
;II5 6
ifJJ 
(JJ 
userJJ 
==JJ 
nullJJ 
)JJ 
{KK 
returnLL 
NotFoundLL 
(LL  
idLL  "
)LL" #
;LL# $
}MM 
awaitNN 
_repositoryNN 
.NN 
DeleteNN $
(NN$ %
idNN% '
)NN' (
;NN( )
returnOO 
OkOO 
(OO 
userOO 
)OO 
;OO 
}PP 	
}QQ 
}RR ú
fC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\DTO\CategoryDTO.cs
	namespace 	
WebApp
 
. 
DTO 
{ 
public 

class 
CategoryDTO 
{ 
public		 
Category		 
Category		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
IEnumerable

 
<

 
	ThreadDTO

 $
>

$ %
Threads

& -
{

. /
get

0 3
;

3 4
set

5 8
;

8 9
}

: ;
} 
} Ä
lC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\DTO\CreateCategoryDTO.cs
	namespace 	
WebApp
 
. 
DTO 
{ 
public 

class 
CreateCategoryDTO "
{ 
[ 	
Required	 
, 
	MaxLength 
( 
$num  
)  !
]! "
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
[ 	
Required	 
, 
	MaxLength 
( 
$num  
)  !
]! "
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ‡	
jC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\DTO\CreateThreadDTO.cs
	namespace 	
WebApp
 
. 
DTO 
{ 
public 

class 
CreateThreadDTO  
{ 
[		 	
Required			 
]		 
public

 
Guid

 

CategoryId

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
[ 	
Required	 
, 
	MaxLength 
( 
$num  
)  !
,! "
Display# *
(* +
Name+ /
=0 1
$str2 8
)8 9
]9 :
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
, 
Display 
( 
Name 
=  !
$str" +
)+ ,
], -
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} «	
fC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\DTO\CreateUsers.cs
	namespace 	
WebApp
 
. 
DTO 
{ 
public 

class 
CreateUsers 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 
IsAdmin 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
Token		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
string

 
Description

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
} 
} è
dC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\DTO\FilterDTO.cs
	namespace 	
WebApp
 
. 
DTO 
{ 
public 

class 
	FilterDTO 
{ 
public		 
KitchenType		 
Cuisine		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 
double

 
Cost
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
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
double 
Rating 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
VotesNumber 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
PreparationTime "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Required	 
] 
public 
List 
< 
IngredientFilterDTO '
>' (
IncludedIngredients) <
{= >
get? B
;B C
setD G
;G H
}I J
[ 	
Required	 
] 
public 
List 
< 
IngredientFilterDTO '
>' (
OnlyIngredients) 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
[ 	
Required	 
] 
public 
List 
< 
IngredientFilterDTO '
>' (
ExcludedIngredients) <
{= >
get? B
;B C
setD G
;G H
}I J
} 
} à
nC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\DTO\IngredientFilterDTO.cs
	namespace 	
WebApp
 
. 
DTO 
{ 
public 

class 
IngredientFilterDTO $
{ 
[ 	
Required	 
, 
	MaxLength 
( 
$num #
)# $
]$ %
public		 
String		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
[

 	
Required

	 
,

 
	MaxLength

 
(

 
$num

 #
)

# $
]

$ %
public 
String 
MeasurementUnit %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ß
nC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\DTO\IngredientRecipeDTO.cs
	namespace 	
WebApp
 
. 
DTO 
{ 
public 

class 
IngredientRecipeDTO $
{ 
[ 	
Required	 
, 
	MaxLength 
( 
$num #
)# $
]$ %
public		 
String		 
Category		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
[

 	
Required

	 
,

 
	MaxLength

 
(

 
$num

 #
)

# $
]

$ %
public 
String 
MeasurementUnit %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[ 	
Required	 
, 
	MaxLength 
( 
$num #
)# $
]$ %
public 
String 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
double 
Quantity 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 
Cost 
{ 
get  
;  !
set" %
;% &
}' (
public 
double 
Weight 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Required	 
, 
	MaxLength 
( 
$num #
)# $
]$ %
public 
String 
PriceCurrency #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ”

cC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\DTO\LoginDTO.cs
	namespace 	
WebApp
 
. 
DTO 
{ 
public 

class 
LoginDTO 
{ 
[ 	
Required	 
, 
	MaxLength 
( 
$num  
)  !
,! "
Display# *
(* +
Name+ /
=0 1
$str2 9
)9 :
,: ;
EmailAddress< H
]H I
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[

 	
Required

	 
,

 
	MaxLength

 
(

 
$num

 
)

  
,

  !
Display

" )
(

) *
Name

* .
=

/ 0
$str

1 ;
)

; <
,

< =
	MinLength

> G
(

G H
$num

H I
)

I J
,

J K
DataType

L T
(

T U
DataType

U ]
.

] ^
Password

^ f
)

f g
]

g h
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ¶
dC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\DTO\RecipeDTO.cs
	namespace 	
WebApp
 
. 
DTO 
{ 
public 

class 
	RecipeDTO 
{ 
[		 	
Required			 
,		 
	MaxLength		 
(		 
$num		 #
)		# $
]		$ %
public

 
String
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
public 
List 
< 
IngredientRecipeDTO '
>' (
Ingredients) 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
[ 	
Required	 
, 
	MaxLength 
( 
$num #
)# $
]$ %
public 
String 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
PreparationTime "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
Servings 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
, 
	MaxLength 
( 
$num #
)# $
]$ %
public 
String 
Summary 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ó
fC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\DTO\RegisterDTO.cs
	namespace 	
WebApp
 
. 
DTO 
{ 
public 

class 
RegisterDTO 
{ 
[ 	
Required	 
, 
	MaxLength 
( 
$num  
)  !
,! "
Display# *
(* +
Name+ /
=0 1
$str2 =
)= >
]> ?
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[

 	
Required

	 
,

 
	MaxLength

 
(

 
$num

  
)

  !
,

! "
Display

# *
(

* +
Name

+ /
=

0 1
$str

2 A
)

A B
,

B C
EmailAddress

D P
]

P Q
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
, 
	MaxLength 
( 
$num 
)  
,  !
Display" )
() *
Name* .
=/ 0
$str1 ;
); <
,< =
	MinLength> G
(G H
$numH I
)I J
,J K
DataTypeL T
(T U
DataTypeU ]
.] ^
Password^ f
)f g
]g h
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
, 
	MaxLength 
( 
$num 
)  
,  !
Display" )
() *
Name* .
=/ 0
$str1 C
)C D
,D E
	MinLengthF O
(O P
$numP Q
)Q R
,R S
DataTypeT \
(\ ]
DataType] e
.e f
Passwordf n
)n o
]o p
[ 	
Compare	 
( 
$str 
, 
ErrorMessage )
=* +
$str, D
)D E
]E F
public 
string 
ConfirmPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ≠
dC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\DTO\ThreadDTO.cs
	namespace 	
WebApp
 
. 
DTO 
{ 
public 

class 
	ThreadDTO 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public		 
string		 
Name		 
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
 
Description

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 

AuthorName  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} €

fC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\DTO\UpdateUsers.cs
	namespace 	
WebApp
 
. 
DTO 
{ 
public 

class 
UpdateUsers 
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
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
bool		 
IsAdmin		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} Ù
C:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Filters\DefaultControllerFilterAttribute.cs
	namespace 	
WebApp
 
. 
Filters 
{ 
public 

class #
DefaultControllerFilter (
:) *!
ActionFilterAttribute+ @
{ 
public 
override 
void 
OnActionExecuting .
(. /"
ActionExecutingContext/ E
contextF M
)M N
{		 	
if

 
(

 
!

 
context

 
.

 

ModelState

 #
.

# $
IsValid

$ +
)

+ ,
{ 
context 
. 
Result 
=  
new! $"
BadRequestObjectResult% ;
(; <
context< C
.C D

ModelStateD N
)N O
;O P
} 
} 	
} 
} ¥
lC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Models\ErrorViewModel.cs
	namespace 	
WebApp
 
. 
Models 
{ 
public 

class 
ErrorViewModel 
{ 
public 
string 
	RequestId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 
ShowRequestId !
=>" $
!% &
string& ,
., -
IsNullOrEmpty- :
(: ;
	RequestId; D
)D E
;E F
} 
}		 œ	
^C:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Program.cs
	namespace 	
WebApp
 
{ 
public 

class 
Program 
{ 
	protected 
Program 
( 
) 
{		 	
}

 	
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
BuildWebHost 
( 
args 
) 
. 
Run "
(" #
)# $
;$ %
} 	
public 
static 
IWebHost 
BuildWebHost +
(+ ,
string, 2
[2 3
]3 4
args5 9
)9 :
=>; =
WebHost 
.  
CreateDefaultBuilder (
(( )
args) -
)- .
. 

UseStartup 
< 
Startup #
># $
($ %
)% &
. 
Build 
( 
) 
; 
} 
} ü
hC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Security\JWTToken.cs
	namespace 	
WebApp
 
. 
Security 
{ 
public		 

static		 
class		 
JwtToken		  
{

 
private 
const 
string 
Secret #
=$ %
$str	& Ä
;
Ä Å
public 
static 
SecurityToken #
GenerateToken$ 1
(1 2
User2 6
user7 ;
,; <
int= @
expireMinutesA N
=O P
$numQ S
)S T
{ 	
var 
symmetricKey 
= 
Convert &
.& '
FromBase64String' 7
(7 8
Secret8 >
)> ?
;? @
var 
tokenHandler 
= 
new "#
JwtSecurityTokenHandler# :
(: ;
); <
;< =
var 
now 
= 
DateTime 
. 
UtcNow %
;% &
var 
tokenDescriptor 
=  !
new" %#
SecurityTokenDescriptor& =
{ 
Subject 
= 
new 
ClaimsIdentity ,
(, -
new- 0
[0 1
]1 2
{ 
new 
Claim 
( 

ClaimTypes (
.( )
Name) -
,- .
user/ 3
.3 4
UserName4 <
)< =
,= >
new 
Claim 
( 

ClaimTypes (
.( )
Name) -
,- .
user/ 3
.3 4
Email4 9
)9 :
,: ;
} 
) 
, 
Expires 
= 
now 
. 

AddMinutes (
(( )
Convert) 0
.0 1
ToInt321 8
(8 9
expireMinutes9 F
)F G
)G H
,H I
SigningCredentials "
=# $
new% (
SigningCredentials) ;
(; <
new< ? 
SymmetricSecurityKey@ T
(T U
symmetricKeyU a
)a b
,b c
SecurityAlgorithmsd v
.v w 
HmacSha256Signature	w ä
)
ä ã
} 
; 
return 
tokenHandler 
.  
CreateToken  +
(+ ,
tokenDescriptor, ;
); <
;< =
}   	
}!! 
}"" å5
^C:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\WebApp\Startup.cs
	namespace 	
WebApp
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddTransient !
<! "
IDatabaseContext" 2
,2 3
DatabaseContext4 C
>C D
(D E
)E F
;F G
services 
. 
AddTransient !
<! "
IUsersRepository" 2
,2 3
UsersRepository4 C
>C D
(D E
)E F
;F G
services 
. 
AddTransient !
<! "$
IForumCategoryRepository" :
,: ;#
ForumCategoryRepository< S
>S T
(T U
)U V
;V W
services 
. 
AddTransient !
<! ""
IForumThreadRepository" 8
,8 9!
ForumThreadRepository: O
>O P
(P Q
)Q R
;R S
services   
.   
AddTransient   !
<  ! "
IFridgeRepository  " 3
,  3 4
FridgeRepository  5 E
>  E F
(  F G
)  G H
;  H I
services!! 
.!! 
AddTransient!! !
<!!! "*
IIngredientsCategoryRepository!!" @
,!!@ A)
IngredientsCategoryRepository!!B _
>!!_ `
(!!` a
)!!a b
;!!b c
services"" 
."" 
AddTransient"" !
<""! ""
IIngredientsRepository""" 8
,""8 9!
IngredientsRepository"": O
>""O P
(""P Q
)""Q R
;""R S
services## 
.## 
AddTransient## !
<##! "
IRecipesRepository##" 4
,##4 5
RecipesRepository##6 G
>##G H
(##H I
)##I J
;##J K
services$$ 
.$$ 
AddDbContext$$ !
<$$! "
DatabaseContext$$" 1
>$$1 2
($$2 3
options$$3 :
=>$$; =
options$$> E
.$$E F
UseSqlServer$$F R
($$R S
Configuration$$S `
.$$` a
GetConnectionString$$a t
($$t u
$str	$$u à
)
$$à â
)
$$â ä
)
$$ä ã
;
$$ã å
services&& 
.&& 
AddMvc&& 
(&& 
options&& #
=>&&$ &
{'' 
options(( 
.(( 
Filters(( #
.((# $
Add(($ '
(((' (
typeof((( .
(((. /#
DefaultControllerFilter((/ F
)((F G
)((G H
;((H I
})) 
)** 
.** 
AddFluentValidation** !
(**! "
fvc**" %
=>**& (
fvc**) ,
.**, -4
(RegisterValidatorsFromAssemblyContaining**- U
<**U V
Startup**V ]
>**] ^
(**^ _
)**_ `
)**` a
.**a b,
AddSessionStateTempDataProvider	**b Å
(
**Å Ç
)
**Ç É
;
**É Ñ
services.. 
... %
AddDistributedMemoryCache.. .
(... /
)../ 0
;..0 1
services00 
.00 

AddSession00 
(00  
options00  '
=>00( *
{11 
options33 
.33 
Cookie33 
.33 
Name33 #
=33$ %
$str33& 8
;338 9
options44 
.44 
IdleTimeout44 #
=44$ %
TimeSpan44& .
.44. /
MaxValue44/ 7
;447 8
options55 
.55 
Cookie55 
.55 
HttpOnly55 '
=55( )
true55* .
;55. /
}66 
)66 
;66 
services88 
.88 
AddSwaggerGen88 "
(88" #
c88# $
=>88% '
{99 
c:: 
.:: 

SwaggerDoc:: 
(:: 
$str:: !
,::! "
new::# &
Info::' +
{::, -
Title::. 3
=::4 5
$str::6 C
,::C D
Version::E L
=::M N
$str::O S
}::T U
)::U V
;::V W
};; 
);; 
;;; 
}<< 	
public?? 
void?? 
	Configure?? 
(?? 
IApplicationBuilder?? 1
app??2 5
,??5 6
IHostingEnvironment??7 J
env??K N
)??N O
{@@ 	
appBB 
.BB 

UseSwaggerBB 
(BB 
)BB 
;BB 
appEE 
.EE 
UseSwaggerUIEE 
(EE 
cEE 
=>EE !
{FF 
cGG 
.GG 
SwaggerEndpointGG !
(GG! "
$strGG" <
,GG< =
$strGG> J
)GGJ K
;GGK L
}HH 
)HH 
;HH 
ifJJ 
(JJ 
envJJ 
.JJ 
IsDevelopmentJJ !
(JJ! "
)JJ" #
)JJ# $
{KK 
appLL 
.LL %
UseDeveloperExceptionPageLL -
(LL- .
)LL. /
;LL/ 0
appMM 
.MM 
UseBrowserLinkMM "
(MM" #
)MM# $
;MM$ %
}NN 
elseOO 
{PP 
appQQ 
.QQ 
UseExceptionHandlerQQ '
(QQ' (
$strQQ( 5
)QQ5 6
;QQ6 7
}RR 
appTT 
.TT 
UseStaticFilesTT 
(TT 
)TT  
;TT  !
appUU 
.UU 

UseSessionUU 
(UU 
)UU 
;UU 
appWW 
.WW 
UseMvcWW 
(WW 
routesWW 
=>WW  
{XX 
routesYY 
.YY 
MapRouteYY 
(YY  
nameZZ 
:ZZ 
$strZZ #
,ZZ# $
template[[ 
:[[ 
$str[[ F
)[[F G
;[[G H
}\\ 
)\\ 
;\\ 
}]] 	
}^^ 
}__ 