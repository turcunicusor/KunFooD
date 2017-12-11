¿
jC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Business\FridgeRepository.cs
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
IFridgeRepository

$ 5
{ 
private 
readonly 
IDatabaseContext )
_databaseContext* :
;: ;
public 
FridgeRepository 
(  
IDatabaseContext  0
databaseContext1 @
)@ A
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
public 
void 
AddPairItem 
(  
PairItem  (
pairItem) 1
)1 2
{ 	
_databaseContext 
. 
	PairItems &
.& '
Add' *
(* +
pairItem+ 3
)3 4
;4 5
_databaseContext 
. 
SaveChanges (
(( )
)) *
;* +
} 	
public 
void 
DeletePairItem "
(" #
Guid# '
ingredientId( 4
,4 5
Guid6 :
recipeId; C
)C D
{ 	
var 
pairItem 
= 
GetPairItem &
(& '
ingredientId' 3
,3 4
recipeId5 =
)= >
;> ?
_databaseContext 
. 
	PairItems &
.& '
Remove' -
(- .
pairItem. 6
)6 7
;7 8
} 	
public 
void 
EditPairItem  
(  !
PairItem! )
pairItem* 2
)2 3
{   	
_databaseContext!! 
.!! 
	PairItems!! &
.!!& '
Update!!' -
(!!- .
pairItem!!. 6
)!!6 7
;!!7 8
_databaseContext"" 
."" 
SaveChanges"" (
(""( )
)"") *
;""* +
}## 	
public%% 
PairItem%% 
GetPairItem%% #
(%%# $
Guid%%$ (
ingredientId%%) 5
,%%5 6
Guid%%7 ;
recipeId%%< D
)%%D E
{&& 	
return'' 
_databaseContext'' #
.''# $
	PairItems''$ -
.''- .
FirstOrDefault''. <
(''< =
pairItem''= E
=>''F H
pairItem(( 
.(( 
IngredientId(( %
==((& (
ingredientId(() 5
&&((6 8
pairItem((9 A
.((A B
	RecipieId((B K
==((L N
recipeId((O W
)((W X
;((X Y
})) 	
public++ 
IReadOnlyCollection++ "
<++" #
PairItem++# +
>+++ ,
GetAll++- 3
(++3 4
)++4 5
{,, 	
return-- 
_databaseContext-- #
.--# $
	PairItems--$ -
.--- .
ToList--. 4
(--4 5
)--5 6
.--6 7

AsReadOnly--7 A
(--A B
)--B C
;--C D
}.. 	
}// 
}00 ¶
wC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Business\IngredientsCategoryRepository.cs
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
 )
IngredientsCategoryRepository

 .
:

/ 0*
IIngredientsCategoryRepository

1 O
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
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
public 
void 
Add 
( 
IngredientCategory *
ingredientCategory+ =
)= >
{ 	
_databaseContext 
.  
IngredientCategories 1
.1 2
Add2 5
(5 6
ingredientCategory6 H
)H I
;I J
_databaseContext 
. 
SaveChanges (
(( )
)) *
;* +
} 	
public 
void 
Delete 
( 
Guid 
id  "
)" #
{ 	
var 
ingredientCategory "
=# $
Get% (
(( )
id) +
)+ ,
;, -
_databaseContext 
.  
IngredientCategories 1
.1 2
Remove2 8
(8 9
ingredientCategory9 K
)K L
;L M
_databaseContext 
. 
SaveChanges (
(( )
)) *
;* +
} 	
public   
void   
Edit   
(   
IngredientCategory   +
ingredientCategory  , >
)  > ?
{!! 	
_databaseContext"" 
.""  
IngredientCategories"" 1
.""1 2
Update""2 8
(""8 9
ingredientCategory""9 K
)""K L
;""L M
_databaseContext## 
.## 
SaveChanges## (
(##( )
)##) *
;##* +
}$$ 	
public&& 
IngredientCategory&& !
Get&&" %
(&&% &
Guid&&& *
id&&+ -
)&&- .
{'' 	
return(( 
_databaseContext(( #
.((# $ 
IngredientCategories(($ 8
.((8 9
FirstOrDefault((9 G
(((G H
ingredientCategory((H Z
=>(([ ]
ingredientCategory)) "
.))" #
Id))# %
==))& (
id))) +
)))+ ,
;)), -
}** 	
public,, 
IReadOnlyCollection,, "
<,," #
IngredientCategory,,# 5
>,,5 6
GetAll,,7 =
(,,= >
),,> ?
{-- 	
return.. 
_databaseContext.. #
...# $ 
IngredientCategories..$ 8
...8 9
ToList..9 ?
(..? @
)..@ A
...A B

AsReadOnly..B L
(..L M
)..M N
;..N O
}// 	
}00 
}11 »
oC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Business\IngredientsRepository.cs
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
 !
IngredientsRepository

 &
:

' ("
IIngredientsRepository

) ?
{ 
private 
readonly 
IDatabaseContext )
_databaseContext* :
;: ;
public !
IngredientsRepository $
($ %
IDatabaseContext% 5
databaseContext6 E
)E F
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
public 
void 
AddIngredient !
(! "

Ingredient" ,

ingredient- 7
)7 8
{ 	
_databaseContext 
. 
Ingredients (
.( )
Add) ,
(, -

ingredient- 7
)7 8
;8 9
_databaseContext 
. 
SaveChanges (
(( )
)) *
;* +
} 	
public 
void 
DeleteIngredient $
($ %
Guid% )
id* ,
), -
{ 	
var 

ingredient 
= 
GetIngredient *
(* +
id+ -
)- .
;. /
_databaseContext 
. 
Ingredients (
.( )
Remove) /
(/ 0

ingredient0 :
): ;
;; <
_databaseContext 
. 
SaveChanges (
(( )
)) *
;* +
} 	
public   
void   
EditIngredient   "
(  " #

Ingredient  # -

ingredient  . 8
)  8 9
{!! 	
_databaseContext"" 
."" 
Ingredients"" (
.""( )
Update"") /
(""/ 0

ingredient""0 :
)"": ;
;""; <
_databaseContext## 
.## 
SaveChanges## (
(##( )
)##) *
;##* +
}$$ 	
public&& 

Ingredient&& 
GetIngredient&& '
(&&' (
Guid&&( ,
id&&- /
)&&/ 0
{'' 	
return(( 
_databaseContext(( #
.((# $
Ingredients(($ /
.((/ 0
FirstOrDefault((0 >
(((> ?

ingredient((? I
=>((J L

ingredient((M W
.((W X
Id((X Z
==(([ ]
id((^ `
)((` a
;((a b
})) 	
public++ 
IReadOnlyCollection++ "
<++" #

Ingredient++# -
>++- .
GetAll++/ 5
(++5 6
)++6 7
{,, 	
return-- 
_databaseContext-- #
.--# $
Ingredients--$ /
.--/ 0
ToList--0 6
(--6 7
)--7 8
.--8 9

AsReadOnly--9 C
(--C D
)--D E
;--E F
}.. 	
}// 
}00 Ó
kC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Business\RecipesRepository.cs
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
RecipesRepository

 "
:

# $
IRecipesRepository

% 7
{ 
private 
readonly 
IDatabaseContext )
_databaseContext* :
;: ;
public 
RecipesRepository  
(  !
IDatabaseContext! 1
databaseContext2 A
)A B
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
public 
void 
	AddRecipe 
( 
Recipe $
recipe% +
)+ ,
{ 	
_databaseContext 
. 
Recipes $
.$ %
Add% (
(( )
recipe) /
)/ 0
;0 1
_databaseContext 
. 
SaveChanges (
(( )
)) *
;* +
} 	
public 
void 
DeleteRecipe  
(  !
Guid! %
id& (
)( )
{ 	
var 
recipe 
= 
	GetRecipe "
(" #
id# %
)% &
;& '
_databaseContext 
. 
Recipes $
.$ %
Remove% +
(+ ,
recipe, 2
)2 3
;3 4
_databaseContext 
. 
SaveChanges (
(( )
)) *
;* +
} 	
public   
void   

EditRecipe   
(   
Recipe   %
recipe  & ,
)  , -
{!! 	
_databaseContext"" 
."" 
Recipes"" $
.""$ %
Update""% +
(""+ ,
recipe"", 2
)""2 3
;""3 4
_databaseContext## 
.## 
SaveChanges## (
(##( )
)##) *
;##* +
}$$ 	
public&& 
Recipe&& 
	GetRecipe&& 
(&&  
Guid&&  $
id&&% '
)&&' (
{'' 	
return(( 
_databaseContext(( #
.((# $
Recipes(($ +
.((+ ,
FirstOrDefault((, :
(((: ;
recipe((; A
=>((B D
recipe((E K
.((K L
Id((L N
==((O Q
id((R T
)((T U
;((U V
})) 	
public++ 
IReadOnlyCollection++ "
<++" #
Recipe++# )
>++) *
GetAll+++ 1
(++1 2
)++2 3
{,, 	
return-- 
_databaseContext-- #
.--# $
Recipes--$ +
.--+ ,
ToList--, 2
(--2 3
)--3 4
.--4 5

AsReadOnly--5 ?
(--? @
)--@ A
;--A B
}.. 	
}// 
}00 Ÿ
iC:\Users\Tamara\Desktop\Work\Anul 3\DotNet\Proiect\KunFooD\SourceCode\KunFooD\Business\UsersRepository.cs
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
 
UsersRepository

  
:

! "
IUsersRepository

# 3
{ 
private 
readonly 
IDatabaseContext )
_databaseContext* :
;: ;
public 
UsersRepository 
( 
IDatabaseContext /
databaseContext0 ?
)? @
{ 	
_databaseContext 
= 
databaseContext .
;. /
} 	
public 
void 
AddUser 
( 
User  
user! %
)% &
{ 	
_databaseContext 
. 
Users "
." #
Add# &
(& '
user' +
)+ ,
;, -
_databaseContext 
. 
SaveChanges (
(( )
)) *
;* +
} 	
public 
void 

DeleteUser 
( 
Guid #
id$ &
)& '
{ 	
var 
user 
= 
GetUser 
( 
id !
)! "
;" #
_databaseContext 
. 
Users "
." #
Remove# )
() *
user* .
). /
;/ 0
_databaseContext 
. 
SaveChanges (
(( )
)) *
;* +
} 	
public   
void   
EditUser   
(   
User   !
user  " &
)  & '
{!! 	
_databaseContext"" 
."" 
Users"" "
.""" #
Update""# )
("") *
user""* .
)"". /
;""/ 0
_databaseContext## 
.## 
SaveChanges## (
(##( )
)##) *
;##* +
}$$ 	
public&& 
User&& 
GetUser&& 
(&& 
Guid&&  
id&&! #
)&&# $
{'' 	
return(( 
_databaseContext(( #
.((# $
Users(($ )
.(() *
FirstOrDefault((* 8
(((8 9
user((9 =
=>((> @
user((A E
.((E F
Id((F H
==((I K
id((L N
)((N O
;((O P
})) 	
public++ 
IReadOnlyCollection++ "
<++" #
User++# '
>++' (
GetAll++) /
(++/ 0
)++0 1
{,, 	
return-- 
_databaseContext-- #
.--# $
Users--$ )
.--) *
ToList--* 0
(--0 1
)--1 2
.--2 3

AsReadOnly--3 =
(--= >
)--> ?
;--? @
}.. 	
}// 
}00 