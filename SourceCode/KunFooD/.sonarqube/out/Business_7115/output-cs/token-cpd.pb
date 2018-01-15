ì
pC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Business\ForumCategoryRepository.cs
	namespace 	
Business
 
{ 
public 

class #
ForumCategoryRepository (
:) *
GenericRepository+ <
<< =
Category= E
>E F
,F G$
IForumCategoryRepositoryH `
{ 
private		 
readonly		 
IDatabaseContext		 )
_databaseContext		* :
;		: ;
public #
ForumCategoryRepository &
(& '
IDatabaseContext' 7
databaseContext8 G
)G H
:I J
baseK O
(O P
databaseContextP _
)_ `
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
} 
} £
nC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Business\ForumThreadRepository.cs
	namespace 	
Business
 
{ 
public 

class !
ForumThreadRepository &
:' (
GenericRepository) :
<: ;
Thread; A
>A B
,B C"
IForumThreadRepositoryD Z
{ 
private 
readonly 
IDatabaseContext )
_databaseContext* :
;: ;
public !
ForumThreadRepository $
($ %
IDatabaseContext% 5
databaseContext6 E
)E F
:G H
baseI M
(M N
databaseContextN ]
)] ^
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Thread& ,
>, -
>- .
GetByCategoryId/ >
(> ?
Guid? C
idD F
)F G
{ 	
return 
await 
_databaseContext )
.) *
Threads* 1
.1 2
Where2 7
(7 8
thread8 >
=>? A
threadB H
.H I

CategoryIdI S
==T V
idW Y
)Y Z
.Z [
ToListAsync[ f
(f g
)g h
;h i
} 	
} 
} ∞
iC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Business\FridgeRepository.cs
	namespace

 	
Business


 
{ 
public 

class 
FridgeRepository !
:" #
GenericRepository 
< 
PairItem "
>" #
,# $
IFridgeRepository% 6
{ 
private 
readonly 
IDatabaseContext )
_databaseContext* :
;: ;
public 
FridgeRepository 
(  
IDatabaseContext  0
databaseContext1 @
)@ A
:B C
baseD H
(H I
databaseContextI X
)X Y
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
public 
async 
Task 
Delete  
(  !
Guid! %
ingredientId& 2
,2 3
Guid4 8
recipeId9 A
)A B
{ 	
var 
pairItem 
= 
await  
Get! $
($ %
ingredientId% 1
,1 2
recipeId3 ;
); <
;< =
_databaseContext 
. 
	PairItems &
.& '
Remove' -
(- .
pairItem. 6
)6 7
;7 8
await 
Save 
( 
) 
; 
} 	
public 
async 
Task 
< 
PairItem "
>" #
Get$ '
(' (
Guid( ,
ingredientId- 9
,9 :
Guid; ?
recipeId@ H
)H I
{ 	
return 
await 
_databaseContext )
.) *
	PairItems* 3
.3 4
FirstOrDefaultAsync4 G
(G H
pairItemH P
=>Q S
pairItem   
.   
IngredientId   !
.  ! "
Equals  " (
(  ( )
ingredientId  ) 5
)  5 6
&&  7 9
pairItem  : B
.  B C
	RecipieId  C L
.  L M
Equals  M S
(  S T
recipeId  T \
)  \ ]
)  ] ^
;  ^ _
}!! 	
public## 
async## 
Task## 
<## 
IEnumerable## %
<##% &
PairItem##& .
>##. /
>##/ 0
GetByRecipe##1 <
(##< =
Guid##= A
recipeId##B J
)##J K
{$$ 	
return%% 
await%% 
_databaseContext%% )
.%%) *
	PairItems%%* 3
.%%3 4
Where%%4 9
(%%9 :
pairItem%%: B
=>%%C E
pairItem&& 
.&& 
	RecipieId&& 
.&& 
Equals&& %
(&&% &
recipeId&&& .
)&&. /
)&&/ 0
.&&0 1
ToListAsync&&1 <
(&&< =
)&&= >
;&&> ?
}'' 	
public)) 
async)) 
Task)) 
<)) 
IEnumerable)) %
<))% &
PairItem))& .
>)). /
>))/ 0
GetByIngredient))1 @
())@ A
Guid))A E
ingredientId))F R
)))R S
{** 	
return++ 
await++ 
_databaseContext++ )
.++) *
	PairItems++* 3
.++3 4
Where++4 9
(++9 :
pairItem++: B
=>++C E
pairItem,, 
.,, 
IngredientId,, !
.,,! "
Equals,," (
(,,( )
ingredientId,,) 5
),,5 6
),,6 7
.,,7 8
ToListAsync,,8 C
(,,C D
),,D E
;,,E F
}-- 	
}.. 
}// ú
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
await"" 
	_entities"" 
."" 
AddAsync"" $
(""$ %
entity""% +
)""+ ,
;"", -
await## 
Save## 
(## 
)## 
;## 
}$$ 	
public&& 
virtual&& 
async&& 
Task&& !
Delete&&" (
(&&( )
Guid&&) -
id&&. 0
)&&0 1
{'' 	
var(( 
itemToRemove(( 
=(( 
await(( $
FindById((% -
(((- .
id((. 0
)((0 1
;((1 2
if)) 
()) 
itemToRemove)) 
!=)) 
null))  $
)))$ %
{** 
	_entities++ 
.++ 
Remove++  
(++  !
itemToRemove++! -
)++- .
;++. /
await,, 
Save,, 
(,, 
),, 
;,, 
}-- 
}.. 	
public00 
virtual00 
async00 
Task00 !
Edit00" &
(00& '
T00' (
entity00) /
)00/ 0
{11 	
	_entities22 
.22 
Update22 
(22 
entity22 #
)22# $
;22$ %
await33 
Save33 
(33 
)33 
;33 
}44 	
public66 
virtual66 
async66 
Task66 !
Save66" &
(66& '
)66' (
{77 	
await88 
(88 
(88 
	DbContext88 
)88 
_databaseContext88 /
)88/ 0
.880 1
SaveChangesAsync881 A
(88A B
)88B C
;88C D
}99 	
}:: 
};; á
vC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Business\IngredientsCategoryRepository.cs
	namespace 	
Business
 
{ 
public		 

class		 )
IngredientsCategoryRepository		 .
:		/ 0
GenericRepository

 
<

 
IngredientCategory

 ,
>

, -
,

- .*
IIngredientsCategoryRepository

/ M
{ 
private 
readonly 
IDatabaseContext )
_databaseContext* :
;: ;
public )
IngredientsCategoryRepository ,
(, -
IDatabaseContext- =
databaseContext> M
)M N
:O P
baseQ U
(U V
databaseContextV e
)e f
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
public 
async 
Task 
< 
bool 
> 
Exists  &
(& '
string' -
name. 2
)2 3
{ 	
return 
await 
_databaseContext )
.) * 
IngredientCategories* >
.> ?
AnyAsync? G
(G H
ingCategH P
=>Q S
ingCateg 
. 
Name 
. 
ToLower $
($ %
)% &
.& '
Equals' -
(- .
name. 2
.2 3
ToLower3 :
(: ;
); <
)< =
)= >
;> ?
} 	
public 
async 
Task 
< 
IngredientCategory ,
>, -
	GetByName. 7
(7 8
string8 >
name? C
)C D
{ 	
return 
await 
_databaseContext )
.) * 
IngredientCategories* >
.> ?
FirstOrDefaultAsync? R
(R S
ingCategS [
=>\ ^
ingCateg 
. 
Name 
. 
ToLower %
(% &
)& '
.' (
Equals( .
(. /
name/ 3
.3 4
ToLower4 ;
(; <
)< =
)= >
)> ?
;? @
} 	
} 
}   ÑÄ
nC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Business\IngredientsRepository.cs
	namespace

 	
Business


 
{ 
public 

class !
IngredientsRepository &
:' (
GenericRepository 
< 

Ingredient $
>$ %
,% &"
IIngredientsRepository' =
{ 
private 
readonly 
IDatabaseContext )
_databaseContext* :
;: ;
private 
readonly *
IIngredientsCategoryRepository 7*
_ingredientsCategoryRepository8 V
;V W
private 
readonly 
IFridgeRepository *
_fridgeRepository+ <
;< =
public 
static 

Dictionary  
<  !
string! '
,' (
double) /
>/ 0
MapMeasurement1 ?
=@ A
newB E

DictionaryF P
<P Q
stringQ W
,W X
doubleY _
>_ `
(` a
)a b
{ 	
{ 
$str 
, 
$num 
} 
, 
{ 
$str 
, 
$num 
} 
, 
{ 
$str 
, 
$num 
} 
, 
{ 
$str 
, 
$num 
} 
, 
{ 
$str 
, 
$num 
} 
, 
{ 
$str 
, 
$num 
} 
, 
{ 
$str 
, 
$num 
} 
, 
{ 
$str 
, 
$num 
} 
, 
{ 
$str 
, 
$num 
} 
, 
{ 
$str 
, 
$num 
} 
, 
{ 
$str 
, 
$num 
} 
, 
{   
$str   
,   
$num   
}   
,   
{!! 
$str!! 
,!! 
$num!! 
}!! 
,!! 
{"" 
$str"" 
,"" 
$num"" 
}"" 
,"" 
{## 
$str## 
,## 
$num## 
}## 
,## 
{$$ 
$str$$ 
,$$ 
$num$$ 
}$$ 
,$$ 
{%% 
$str%% 
,%% 
$num%% 
}%% 
,%% 
{&& 
$str&& 
,&& 
$num&& 
}&& 
,&& 
{'' 
$str'' 
,'' 
$num'' 
}'' 
,'' 
{(( 
$str(( 
,(( 
$num(( 
}(( 
,(( 
{)) 
$str)) 
,)) 
$num)) 
})) 
,)) 
{** 
$str** 
,** 
$num** 
}** 
,** 
{++ 
$str++ 
,++ 
$num++ 
}++ 
,++ 
{,, 
$str,, 
,,, 
$num,, 
},, 
,,, 
{-- 
$str-- 
,-- 
$num-- 
}-- 
,-- 
{.. 
$str.. 
,.. 
$num.. 
}.. 
}// 	
;//	 

public11 
!
IngredientsRepository11  
(11  !
IDatabaseContext11! 1
databaseContext112 A
,11A B*
IIngredientsCategoryRepository11C a)
ingredientsCategoryRepository11b 
,	11 Ä
IFridgeRepository
11Å í
fridgeRepository
11ì £
)
11£ §
:
11• ¶
base
11ß ´
(
11´ ¨
databaseContext
11¨ ª
)
11ª º
{22 	
_databaseContext33 
=33 
databaseContext33 .
;33. /*
_ingredientsCategoryRepository44 *
=44+ ,)
ingredientsCategoryRepository44- J
;44J K
_fridgeRepository55 
=55 
fridgeRepository55  0
;550 1
}66 	
public88 
async88 
Task88 
<88 
bool88 
>88 
Exists88  &
(88& '
String88' -
name88. 2
)882 3
{99 	
return:: 
await:: 
_databaseContext:: )
.::) *
Ingredients::* 5
.::5 6
AnyAsync::6 >
(::> ?

ingredient::? I
=>::J L

ingredient::M W
.::W X
Name::X \
.::\ ]
ToLower::] d
(::d e
)::e f
.::f g
Equals::g m
(::m n
name::n r
.::r s
ToLower::s z
(::z {
)::{ |
)::| }
)::} ~
;::~ 
};; 	
public== 
async== 
Task== 
<== 
bool== 
>== 
Exists==  &
(==& '
String==' -
name==. 2
,==2 3
string==4 :
measureUnit==; F
)==F G
{>> 	
return?? 
await?? 
_databaseContext?? )
.??) *
Ingredients??* 5
.??5 6
AnyAsync??6 >
(??> ?

ingredient??? I
=>??J L

ingredient??M W
.??W X
Name??X \
.??\ ]
ToLower??] d
(??d e
)??e f
.??f g
Equals??g m
(??m n
name??n r
.??r s
ToLower??s z
(??z {
)??{ |
)??| }
&&	??~ Ä

ingredient
??Å ã
.
??ã å
MeasuredUnit
??å ò
.
??ò ô
ToLower
??ô †
(
??† °
)
??° ¢
.
??¢ £
Equals
??£ ©
(
??© ™
measureUnit
??™ µ
.
??µ ∂
ToLower
??∂ Ω
(
??Ω æ
)
??æ ø
)
??ø ¿
)
??¿ ¡
;
??¡ ¬
}@@ 	
publicBB 
asyncBB 
TaskBB 
<BB 
IEnumerableBB %
<BB% &

IngredientBB& 0
>BB0 1
>BB1 2
	GetByNameBB3 <
(BB< =
stringBB= C
nameBBD H
)BBH I
{CC 	
returnDD 
awaitDD 
_databaseContextDD )
.DD) *
IngredientsDD* 5
.DD5 6
WhereDD6 ;
(DD; <

ingredientDD< F
=>DDG I

ingredientDDJ T
.DDT U
NameDDU Y
.DDY Z
ToLowerDDZ a
(DDa b
)DDb c
.DDc d
EqualsDDd j
(DDj k
nameDDk o
.DDo p
ToLowerDDp w
(DDw x
)DDx y
)DDy z
)DDz {
.DD{ |
ToListAsync	DD| á
(
DDá à
)
DDà â
;
DDâ ä
}EE 	
publicGG 
asyncGG 
TaskGG 
<GG 

IngredientGG $
>GG$ %
GetByNameAndMeasureGG& 9
(GG9 :
StringGG: @
nameGGA E
,GGE F
StringGGG M
measureUnitGGN Y
)GGY Z
{HH 	
returnII 
awaitII 
_databaseContextII )
.II) *
IngredientsII* 5
.II5 6
FirstOrDefaultAsyncII6 I
(III J

ingredientIIJ T
=>IIU W

ingredientIIX b
.IIb c
NameIIc g
.IIg h
ToLowerIIh o
(IIo p
)IIp q
.IIq r
EqualsIIr x
(IIx y
nameIIy }
.II} ~
ToLower	II~ Ö
(
IIÖ Ü
)
IIÜ á
)
IIá à
&&
IIâ ã

ingredient
IIå ñ
.
IIñ ó
MeasuredUnit
IIó £
.
II£ §
ToLower
II§ ´
(
II´ ¨
)
II¨ ≠
.
II≠ Æ
Equals
IIÆ ¥
(
II¥ µ
measureUnit
IIµ ¿
.
II¿ ¡
ToLower
II¡ »
(
II» …
)
II…  
)
II  À
)
IIÀ Ã
;
IIÃ Õ
}JJ 	
publicLL 
asyncLL 
TaskLL %
UpdateIngredientsCategoryLL 3
(LL3 4
StringLL4 :
ingredientNameLL; I
,LLI J
GuidLLK O
?LLO P

categoryIdLLQ [
)LL[ \
{MM 	
ifOO 
(OO 

categoryIdOO 
!=OO 
nullOO "
)OO" #
{PP 
IEnumerableQQ 
<QQ 

IngredientQQ &
>QQ& '
ingredientsQQ( 3
=QQ4 5
awaitQQ6 ;
GetAllQQ< B
(QQB C
)QQC D
;QQD E
foreachRR 
(RR 
varRR 

ingredientRR '
inRR( *
ingredientsRR+ 6
)RR6 7
ifSS 
(SS 
ingredientNameSS &
.SS& '
EqualsSS' -
(SS- .

ingredientSS. 8
.SS8 9
NameSS9 =
)SS= >
)SS> ?

ingredientTT "
.TT" #
UpdateTT# )
(TT) *

categoryIdTT* 4
??TT5 7
GuidTT8 <
.TT< =
EmptyTT= B
,TTB C

ingredientTTD N
.TTN O
NameTTO S
,TTS T

ingredientTTU _
.TT_ `
MeasuredUnitTT` l
,TTl m

ingredientTTn x
.TTx y
CostTTy }
)TT} ~
;TT~ 
_databaseContextUU  
.UU  !
SaveChangesUU! ,
(UU, -
)UU- .
;UU. /
}VV 
}WW 	
publicYY 
asyncYY 
TaskYY 
<YY 
GuidYY 
?YY 
>YY  
GetSpecificCategoryYY! 4
(YY4 5
StringYY5 ;
ingredientNameYY< J
)YYJ K
{ZZ 	
IEnumerable[[ 
<[[ 

Ingredient[[ "
>[[" #
ingredients[[$ /
=[[0 1
await[[2 7
GetAll[[8 >
([[> ?
)[[? @
;[[@ A
foreach\\ 
(\\ 
var\\ 

ingredient\\ #
in\\$ &
ingredients\\' 2
)\\2 3
{]] 
if^^ 
(^^ 
ingredientName^^ "
.^^" #
Equals^^# )
(^^) *

ingredient^^* 4
.^^4 5
Name^^5 9
)^^9 :
)^^: ;
{__ 
if`` 
(`` 
!`` 
(`` 
await`` *
_ingredientsCategoryRepository``  >
.``> ?
FindById``? G
(``G H

ingredient``H R
.``R S 
IngredientCategoryId``S g
)``g h
)``h i
.``i j
Name``j n
.``n o
Equals``o u
(``u v
$str	``v â
)
``â ä
)
``ä ã
returnaa 

ingredientaa )
.aa) * 
IngredientCategoryIdaa* >
;aa> ?
}bb 
}cc 
returndd 
nulldd 
;dd 
}ee 	
publicgg 
asyncgg 
Taskgg 
AddIngredientCustomgg -
(gg- .
Guidgg. 2
recipeIdgg3 ;
,gg; <
stringgg= C
categoryNameggD P
,ggP Q
stringggR X
measureUnitggY d
,ggd e
stringggf l
nameggm q
,ggq r
doublehh 
quantityhh 
,hh 
doublehh #
costhh$ (
,hh( )
doublehh* 0
weighthh1 7
)hh7 8
{ii 	

Ingredientjj 

ingredientjj !
;jj! "
ifkk 
(kk 
!kk 
awaitkk 
Existskk 
(kk 
namekk "
,kk" #
measureUnitkk$ /
)kk/ 0
)kk0 1
{ll 
Guidmm 

categoryIdmm 
;mm  
ifnn 
(nn 
!nn 
awaitnn *
_ingredientsCategoryRepositorynn :
.nn: ;
Existsnn; A
(nnA B
categoryNamennB N
)nnN O
)nnO P
{oo 
IngredientCategorypp &
igCatpp' ,
=pp- .
IngredientCategorypp/ A
.ppA B
CreateppB H
(ppH I
categoryNameppI U
)ppU V
;ppV W
awaitqq *
_ingredientsCategoryRepositoryqq 8
.qq8 9
Addqq9 <
(qq< =
igCatqq= B
)qqB C
;qqC D

categoryIdrr 
=rr  
igCatrr! &
.rr& '
Idrr' )
;rr) *
}ss 
elsett 
{uu 

categoryIdvv 
=vv  
(vv! "
awaitvv" '*
_ingredientsCategoryRepositoryvv( F
.vvF G
	GetByNamevvG P
(vvP Q
categoryNamevvQ ]
)vv] ^
)vv^ _
.vv_ `
Idvv` b
;vvb c
}ww 
doublexx 
scalexx 
=xx !
IngredientsRepositoryxx 4
.xx4 5
MapMeasurementxx5 C
[xxC D
$strxxD O
]xxO P
;xxP Q
ifyy 
(yy !
IngredientsRepositoryyy )
.yy) *
MapMeasurementyy* 8
.yy8 9
ContainsKeyyy9 D
(yyD E
measureUnityyE P
)yyP Q
)yyQ R
scalezz 
=zz !
IngredientsRepositoryzz 1
.zz1 2
MapMeasurementzz2 @
[zz@ A
measureUnitzzA L
]zzL M
;zzM N

ingredient|| 
=|| 

Ingredient|| '
.||' (
Create||( .
(||. /

categoryId||/ 9
,||9 :
name||; ?
,||? @
measureUnit||A L
,||L M
cost||N R
*||R S
scale||S X
*||X Y
weight||Y _
/||_ `
$num||` h
)||h i
;||i j
await}} 
Add}} 
(}} 

ingredient}} $
)}}$ %
;}}% &
await~~ %
UpdateIngredientsCategory~~ /
(~~/ 0
name~~0 4
,~~4 5
await~~6 ;
GetSpecificCategory~~< O
(~~O P
name~~P T
)~~T U
)~~U V
;~~V W
} 
else
ÄÄ 
{
ÅÅ 
if
ÇÇ 
(
ÇÇ 
!
ÇÇ 
categoryName
ÇÇ !
.
ÇÇ! "
Equals
ÇÇ" (
(
ÇÇ( )
$str
ÇÇ) <
)
ÇÇ< =
)
ÇÇ= >
{
ÉÉ 
if
ÑÑ 
(
ÑÑ 
!
ÑÑ 
await
ÑÑ ,
_ingredientsCategoryRepository
ÑÑ  >
.
ÑÑ> ?
Exists
ÑÑ? E
(
ÑÑE F
categoryName
ÑÑF R
)
ÑÑR S
)
ÑÑS T
{
ÖÖ  
IngredientCategory
ÜÜ *
igCat
ÜÜ+ 0
=
ÜÜ1 2 
IngredientCategory
ÜÜ3 E
.
ÜÜE F
Create
ÜÜF L
(
ÜÜL M
categoryName
ÜÜM Y
)
ÜÜY Z
;
ÜÜZ [
await
áá ,
_ingredientsCategoryRepository
áá <
.
áá< =
Add
áá= @
(
áá@ A
igCat
ááA F
)
ááF G
;
ááG H
}
àà 
await
ââ '
UpdateIngredientsCategory
ââ 3
(
ââ3 4
name
ââ4 8
,
ââ8 9
(
ââ: ;
await
ââ; @,
_ingredientsCategoryRepository
ââA _
.
ââ_ `
	GetByName
ââ` i
(
ââi j
categoryName
ââj v
)
ââv w
)
ââw x
.
ââx y
Id
âây {
)
ââ{ |
;
ââ| }
}
ää 

ingredient
ãã 
=
ãã 
await
ãã "!
GetByNameAndMeasure
ãã# 6
(
ãã6 7
name
ãã7 ;
,
ãã; <
measureUnit
ãã= H
)
ããH I
;
ããI J
}
åå 
await
çç 
_fridgeRepository
çç #
.
çç# $
Add
çç$ '
(
çç' (
PairItem
çç( 0
.
çç0 1
Create
çç1 7
(
çç7 8

ingredient
çç8 B
.
ççB C
Id
ççC E
,
ççE F
recipeId
ççG O
,
ççO P
quantity
ççQ Y
)
ççY Z
)
ççZ [
;
çç[ \
}
éé 	
}
èè 
}êê “ï
jC:\Users\Turcu Nicusor\Desktop\Work\Anul 3\DotNet\KunFooD\SourceCode\KunFooD\Business\RecipesRepository.cs
	namespace

 	
Business


 
{ 
public 

class 
RecipesRepository "
:# $
GenericRepository 
< 
Recipe  
>  !
,! "
IRecipesRepository# 5
{ 
private 
readonly 
IDatabaseContext )
_databaseContext* :
;: ;
private 
readonly 
IFridgeRepository *
_fridgeRepository+ <
;< =
private 
readonly "
IIngredientsRepository /"
_ingredientsRepository0 F
;F G
public 
RecipesRepository  
(  !
IDatabaseContext! 1
databaseContext2 A
,A B
IFridgeRepositoryC T
fridgeRepositoryU e
,e f"
IIngredientsRepositoryg }"
ingredientsRepository	~ ì
)
ì î
:
ï ñ
base
ó õ
(
õ ú
databaseContext
ú ´
)
´ ¨
{ 	
_databaseContext 
= 
databaseContext .
;. /
_fridgeRepository 
= 
fridgeRepository  0
;0 1"
_ingredientsRepository "
=# $!
ingredientsRepository% :
;: ;
} 	
public 
async 
Task 
< 
Double  
>  !
GetCostById" -
(- .
Guid. 2
id3 5
)5 6
{ 	
double 
cost 
= 
$num 
; 
IEnumerable 
< 
PairItem  
>  !
pairs" '
=( )
await* /
_fridgeRepository0 A
.A B
GetByRecipeB M
(M N
idN P
)P Q
;Q R
foreach 
( 
PairItem 
pair "
in# %
pairs& +
)+ ,
{ 
var   

ingredient   
=    
await  ! &"
_ingredientsRepository  ' =
.  = >
FindById  > F
(  F G
pair  G K
.  K L
IngredientId  L X
)  X Y
;  Y Z
cost!! 
+=!! 

ingredient!! "
.!!" #
Cost!!# '
*!!( )
pair!!* .
.!!. /
Quantity!!/ 7
;!!7 8
}"" 
return## 
cost## 
;## 
}$$ 	
public&& 
async&& 
Task&& 
UpdateAllCosts&& (
(&&( )
)&&) *
{'' 	
IEnumerable(( 
<(( 
Recipe(( 
>(( 
recipes((  '
=((( )
await((* /
GetAll((0 6
(((6 7
)((7 8
;((8 9
foreach)) 
()) 
Recipe)) 
recipe)) "
in))# %
recipes))& -
)))- .
{** 
recipe++ 
.++ 
Cost++ 
=++ 
await++ #
GetCostById++$ /
(++/ 0
recipe++0 6
.++6 7
Id++7 9
)++9 :
;++: ;
},, 
await-- 
Save-- 
(-- 
)-- 
;-- 
}.. 	
public00 
async00 
Task00 
<00 
IEnumerable00 %
<00% &
Recipe00& ,
>00, -
>00- .
GetByKitchenType00/ ?
(00? @
KitchenType00@ K
cuisine00L S
,00S T
Task00U Y
<00Y Z
IEnumerable00Z e
<00e f
Recipe00f l
>00l m
>00m n
recipes00o v
)00v w
{11 	
return22 
(22 
await22 
recipes22 !
)22! "
.22" #
Where22# (
(22( )
recipe22) /
=>220 2
recipe33 
.33 
Cuisine33 
==33 !
cuisine33" )
)33) *
;33* +
}44 	
public66 
async66 
Task66 
<66 
IEnumerable66 %
<66% &
Recipe66& ,
>66, -
>66- .
	GetByCost66/ 8
(668 9
Double669 ?
cost66@ D
,66D E
Task66F J
<66J K
IEnumerable66K V
<66V W
Recipe66W ]
>66] ^
>66^ _
recipes66` g
)66g h
{77 	
return99 
(99 
await99 
recipes99 !
)99! "
.99" #
Where99# (
(99( )
recipe99) /
=>990 2
recipe:: 
.:: 
Cost:: 
<:: 
cost:: "
&&::# %
recipe::& ,
.::, -
Cost::- 1
>::2 3
$num::4 5
)::5 6
;::6 7
};; 	
public== 
async== 
Task== 
<== 
IEnumerable== %
<==% &
Recipe==& ,
>==, -
>==- .
	GetByName==/ 8
(==8 9
String==9 ?
name==@ D
,==D E
Task==F J
<==J K
IEnumerable==K V
<==V W
Recipe==W ]
>==] ^
>==^ _
recipes==` g
)==g h
{>> 	
return?? 
(?? 
await?? 
recipes?? !
)??! "
.??" #
Where??# (
(??( )
recipe??) /
=>??0 2
recipe@@ 
.@@ 
Name@@ 
.@@ 
ToLower@@ #
(@@# $
)@@$ %
.@@% &
Contains@@& .
(@@. /
name@@/ 3
.@@3 4
ToLower@@4 ;
(@@; <
)@@< =
)@@= >
)@@> ?
;@@? @
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
IEnumerableCC %
<CC% &
RecipeCC& ,
>CC, -
>CC- .
GetByRatingCC/ :
(CC: ;
DoubleCC; A
ratingCCB H
,CCH I
TaskCCJ N
<CCN O
IEnumerableCCO Z
<CCZ [
RecipeCC[ a
>CCa b
>CCb c
recipesCCd k
)CCk l
{DD 	
returnEE 
(EE 
awaitEE 
recipesEE !
)EE! "
.EE" #
WhereEE# (
(EE( )
recipeEE) /
=>EE0 2
recipeFF 
.FF 
RatingFF 
>=FF  
ratingFF! '
)FF' (
;FF( )
}GG 	
publicII 
asyncII 
TaskII 
<II 
IEnumerableII %
<II% &
RecipeII& ,
>II, -
>II- .
GetByVotesNumberII/ ?
(II? @
intII@ C
votesIID I
,III J
TaskIIK O
<IIO P
IEnumerableIIP [
<II[ \
RecipeII\ b
>IIb c
>IIc d
recipesIIe l
)IIl m
{JJ 	
returnKK 
(KK 
awaitKK 
recipesKK !
)KK! "
.KK" #
WhereKK# (
(KK( )
recipeKK) /
=>KK0 2
recipeLL 
.LL 
VotesNumberLL "
>=LL# %
votesLL& +
)LL+ ,
;LL, -
}MM 	
publicOO 
asyncOO 
TaskOO 
<OO 
IEnumerableOO %
<OO% &
RecipeOO& ,
>OO, -
>OO- . 
GetByPrepatationTimeOO/ C
(OOC D
intOOD G
minutesOOH O
,OOO P
TaskOOQ U
<OOU V
IEnumerableOOV a
<OOa b
RecipeOOb h
>OOh i
>OOi j
recipesOOk r
)OOr s
{PP 	
intQQ 

aproxErrorQQ 
=QQ 
$numQQ 
;QQ  
returnRR 
(RR 
awaitRR 
recipesRR !
)RR! "
.RR" #
WhereRR# (
(RR( )
recipeRR) /
=>RR0 2
recipeSS 
.SS 
PreparationTimeSS &
>=SS' )
minutesSS* 1
-SS2 3

aproxErrorSS4 >
&&SS? A
recipeSSB H
.SSH I
PreparationTimeSSI X
<=SSY [
minutesSS\ c
+SSd e

aproxErrorSSf p
)SSp q
;SSq r
}TT 	
publicVV 
asyncVV 
TaskVV 
<VV 
boolVV 
>VV 
ContainsIngredientVV  2
(VV2 3
GuidVV3 7
recipeIdVV8 @
,VV@ A
GuidVVB F
ingredientIdVVG S
)VVS T
{WW 	
IEnumerableXX 
<XX 
PairItemXX  
>XX  !
pairsXX" '
=XX( )
awaitXX* /
_fridgeRepositoryXX0 A
.XXA B
GetByRecipeXXB M
(XXM N
recipeIdXXN V
)XXV W
;XXW X
foreachYY 
(YY 
PairItemYY 
pairYY "
inYY# %
pairsYY& +
)YY+ ,
{ZZ 
if[[ 
([[ 
pair[[ 
.[[ 
IngredientId[[ %
==[[& (
ingredientId[[) 5
)[[5 6
return\\ 
true\\ 
;\\  
}]] 
return^^ 
false^^ 
;^^ 
}__ 	
publicaa 
asyncaa 
Taskaa 
<aa 
intaa 
>aa 
IngredientsNumberaa 0
(aa0 1
Guidaa1 5
recipeIdaa6 >
)aa> ?
{bb 	
IEnumerablecc 
<cc 
PairItemcc  
>cc  !
pairscc" '
=cc( )
awaitcc* /
_fridgeRepositorycc0 A
.ccA B
GetByRecipeccB M
(ccM N
recipeIdccN V
)ccV W
;ccW X
returndd 
pairsdd 
.dd 
Countdd 
(dd 
)dd  
;dd  !
}ee 	
publicgg 
asyncgg 
Taskgg 
<gg 
boolgg 
>gg $
IncludesTheseIngredientsgg  8
(gg8 9
Guidgg9 =
recipeIdgg> F
,ggF G
ListggH L
<ggL M

IngredientggM W
>ggW X
ingredientsggY d
)ggd e
{hh 	
foreachii 
(ii 
varii 

ingredientii #
inii$ &
ingredientsii' 2
)ii2 3
{jj 
ifkk 
(kk 
falsekk 
==kk 
awaitkk "
ContainsIngredientkk# 5
(kk5 6
recipeIdkk6 >
,kk> ?

ingredientkk@ J
.kkJ K
IdkkK M
)kkM N
)kkN O
returnll 
falsell  
;ll  !
}mm 
returnnn 
truenn 
;nn 
}oo 	
publicqq 
asyncqq 
Taskqq 
<qq 
boolqq 
>qq $
ExcludesTheseIngredientsqq  8
(qq8 9
Guidqq9 =
recipeIdqq> F
,qqF G
ListqqH L
<qqL M

IngredientqqM W
>qqW X
ingredientsqqY d
)qqd e
{rr 	
foreachss 
(ss 
varss 

ingredientss #
inss$ &
ingredientsss' 2
)ss2 3
{tt 
ifuu 
(uu 
awaituu 
ContainsIngredientuu ,
(uu, -
recipeIduu- 5
,uu5 6

ingredientuu7 A
.uuA B
IduuB D
)uuD E
)uuE F
returnvv 
falsevv  
;vv  !
}ww 
returnxx 
truexx 
;xx 
}yy 	
publiczz 
asynczz 
Taskzz 
<zz 
IEnumerablezz %
<zz% &
Recipezz& ,
>zz, -
>zz- .
GetByIngredientszz/ ?
(zz? @
Listzz@ D
<zzD E

IngredientzzE O
>zzO P
includedzzQ Y
,zzY Z
Listzz[ _
<zz_ `

Ingredientzz` j
>zzj k
excludedzzl t
,zzt u
Taskzzv z
<zzz {
IEnumerable	zz{ Ü
<
zzÜ á
Recipe
zzá ç
>
zzç é
>
zzé è
recipes
zzê ó
)
zzó ò
{{{ 	
List}} 
<}} 
Recipe}} 
>}} 
recipesResult}} &
=}}' (
new}}) ,
List}}- 1
<}}1 2
Recipe}}2 8
>}}8 9
(}}9 :
)}}: ;
;}}; <
foreach~~ 
(~~ 
var~~ 
recipe~~ 
in~~  "
recipes~~# *
.~~* +
Result~~+ 1
)~~1 2
{ 
if
ÄÄ 
(
ÄÄ 
await
ÄÄ &
IncludesTheseIngredients
ÄÄ 1
(
ÄÄ1 2
recipe
ÄÄ2 8
.
ÄÄ8 9
Id
ÄÄ9 ;
,
ÄÄ; <
included
ÄÄ= E
)
ÄÄE F
&&
ÄÄG I
await
ÄÄJ O&
ExcludesTheseIngredients
ÄÄP h
(
ÄÄh i
recipe
ÄÄi o
.
ÄÄo p
Id
ÄÄp r
,
ÄÄr s
excluded
ÄÄt |
)
ÄÄ| }
)
ÄÄ} ~
recipesResult
ÅÅ !
.
ÅÅ! "
Add
ÅÅ" %
(
ÅÅ% &
recipe
ÅÅ& ,
)
ÅÅ, -
;
ÅÅ- .
}
ÇÇ 
return
ÉÉ 
recipesResult
ÉÉ  
;
ÉÉ  !
}
ÑÑ 	
public
ÜÜ 
async
ÜÜ 
Task
ÜÜ 
<
ÜÜ 
IEnumerable
ÜÜ %
<
ÜÜ% &
Recipe
ÜÜ& ,
>
ÜÜ, -
>
ÜÜ- ."
GetByOnlyIngredients
ÜÜ/ C
(
ÜÜC D
List
ÜÜD H
<
ÜÜH I

Ingredient
ÜÜI S
>
ÜÜS T
ingredients
ÜÜU `
,
ÜÜ` a
Task
ÜÜb f
<
ÜÜf g
IEnumerable
ÜÜg r
<
ÜÜr s
Recipe
ÜÜs y
>
ÜÜy z
>
ÜÜz {
recipesÜÜ| É
)ÜÜÉ Ñ
{
áá 	
List
ââ 
<
ââ 
Recipe
ââ 
>
ââ 
recipesResult
ââ &
=
ââ' (
new
ââ) ,
List
ââ- 1
<
ââ1 2
Recipe
ââ2 8
>
ââ8 9
(
ââ9 :
)
ââ: ;
;
ââ; <
foreach
ää 
(
ää 
var
ää 
recipe
ää 
in
ää  "
recipes
ää# *
.
ää* +
Result
ää+ 1
)
ää1 2
{
ãã 
if
åå 
(
åå 
await
åå &
IncludesTheseIngredients
åå 2
(
åå2 3
recipe
åå3 9
.
åå9 :
Id
åå: <
,
åå< =
ingredients
åå> I
)
ååI J
&&
ååK M
ingredients
ååN Y
.
ååY Z
Count
ååZ _
==
åå` b
await
ååc h
IngredientsNumber
ååi z
(
ååz {
recipeåå{ Å
.ååÅ Ç
IdååÇ Ñ
)ååÑ Ö
)ååÖ Ü
recipesResult
çç !
.
çç! "
Add
çç" %
(
çç% &
recipe
çç& ,
)
çç, -
;
çç- .
}
éé 
return
èè 
recipesResult
èè  
;
èè  !
}
êê 	
public
íí 
async
íí 
Task
íí 
<
íí 
IEnumerable
íí %
<
íí% &
Recipe
íí& ,
>
íí, -
>
íí- .
GetByFilter
íí/ :
(
íí: ;
Filter
íí; A
filter
ííB H
)
ííH I
{
ìì 	
Task
îî 
<
îî 
IEnumerable
îî 
<
îî 
Recipe
îî #
>
îî# $
>
îî$ %
recipes
îî& -
=
îî. /
GetAll
îî0 6
(
îî6 7
)
îî7 8
;
îî8 9
if
ïï 
(
ïï 
filter
ïï 
.
ïï 
Cuisine
ïï 
!=
ïï !
KitchenType
ïï" -
.
ïï- .
Unspecified
ïï. 9
)
ïï9 :
recipes
ññ 
=
ññ 
GetByKitchenType
ññ *
(
ññ* +
filter
ññ+ 1
.
ññ1 2
Cuisine
ññ2 9
,
ññ9 :
recipes
ññ; B
)
ññB C
;
ññC D
if
óó 
(
óó 
filter
óó 
.
óó 
Cost
óó 
>
óó 
$num
óó 
)
óó  
recipes
òò 
=
òò 
	GetByCost
òò #
(
òò# $
filter
òò$ *
.
òò* +
Cost
òò+ /
,
òò/ 0
recipes
òò1 8
)
òò8 9
;
òò9 :
if
ôô 
(
ôô 
filter
ôô 
.
ôô 
Name
ôô 
!=
ôô 
$str
ôô !
)
ôô! "
recipes
öö 
=
öö 
	GetByName
öö #
(
öö# $
filter
öö$ *
.
öö* +
Name
öö+ /
,
öö/ 0
recipes
öö1 8
)
öö8 9
;
öö9 :
recipes
õõ 
=
õõ 
GetByRating
õõ !
(
õõ! "
filter
õõ" (
.
õõ( )
Rating
õõ) /
,
õõ/ 0
recipes
õõ1 8
)
õõ8 9
;
õõ9 :
recipes
úú 
=
úú 
GetByVotesNumber
úú &
(
úú& '
filter
úú' -
.
úú- .
VotesNumber
úú. 9
,
úú9 :
recipes
úú; B
)
úúB C
;
úúC D
if
ùù 
(
ùù 
filter
ùù 
.
ùù 
PreparationTime
ùù &
!=
ùù' )
$num
ùù* +
)
ùù+ ,
recipes
ûû 
=
ûû "
GetByPrepatationTime
ûû .
(
ûû. /
filter
ûû/ 5
.
ûû5 6
PreparationTime
ûû6 E
,
ûûE F
recipes
ûûG N
)
ûûN O
;
ûûO P
if
†† 
(
†† 
filter
†† 
.
†† 
OnlyIngredients
†† &
.
††& '
Count
††' ,
!=
††- /
$num
††0 1
)
††1 2
recipes
°° 
=
°° "
GetByOnlyIngredients
°° .
(
°°. /
filter
°°/ 5
.
°°5 6
OnlyIngredients
°°6 E
,
°°E F
recipes
°°G N
)
°°N O
;
°°O P
else
¢¢ 
if
¢¢ 
(
¢¢ 
filter
¢¢ 
.
¢¢ !
ExcludedIngredients
¢¢ /
.
¢¢/ 0
Count
¢¢0 5
!=
¢¢6 8
$num
¢¢9 :
||
¢¢: <
filter
¢¢= C
.
¢¢C D!
IncludedIngredients
¢¢D W
.
¢¢W X
Count
¢¢X ]
!=
¢¢^ `
$num
¢¢a b
)
¢¢b c
recipes
££ 
=
££ 
GetByIngredients
££ *
(
££* +
filter
££+ 1
.
££1 2!
IncludedIngredients
££2 E
,
££E F
filter
££G M
.
££M N!
ExcludedIngredients
££N a
,
££a b
recipes
££c j
)
££j k
;
££k l
return
•• 
await
•• 
recipes
••  
;
••  !
}
¶¶ 	
}
ßß 
}®® ‚
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
} 	
public 
async 
Task 
< 
User 
> 
	GetByName  )
() *
string* 0
userName1 9
)9 :
{   	
return!! 
await!! 
_databaseContext!! )
.!!) *
Users!!* /
.!!/ 0
FirstOrDefaultAsync!!0 C
(!!C D
user!!D H
=>!!I K
user!!L P
.!!P Q
UserName!!Q Y
.!!Y Z
Equals!!Z `
(!!` a
userName!!a i
)!!i j
)!!j k
;!!k l
}"" 	
}## 
}$$ 