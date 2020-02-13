import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.IRecipeFunction;

var itemCraft as IItemStack;
var Mstair as IItemStack;
print("############################_Adding Recipe_############################");

for stair in itemUtils.getItemsByRegexRegistryName(".*stairs.*"){
	for recipe in recipes.getRecipesFor(stair){
		itemCraft=recipe.ingredients1D[0].items[0];
		recipes.remove(stair);
		recipes.addShaped(stair*6,[[itemCraft,null,null],[itemCraft,itemCraft,null],[itemCraft,itemCraft,itemCraft]]);
		recipes.addShapeless(itemCraft,[stair]);
	}
}

val stairArray = [
	<undergroundbiomes:igneous_stone_stairs>,
	<undergroundbiomes:igneous_cobble_stairs>,
	<undergroundbiomes:igneous_brick_stairs>,
	<undergroundbiomes:metamorphic_stone_stairs>,
	<undergroundbiomes:metamorphic_cobble_stairs>,
	<undergroundbiomes:metamorphic_brick_stairs>,
	<undergroundbiomes:sedimentary_stone_stairs>
] as IItemStack[];

for stair in stairArray{
	for i in 1 to 8 {
		Mstair=stair.definition.makeStack(i);
		for recipe in recipes.getRecipesFor(Mstair){
			itemCraft=recipe.ingredients1D[0].items[0];
			recipes.remove(Mstair);
			recipes.addShaped(Mstair*6,[[itemCraft,null,null],[itemCraft,itemCraft,null],[itemCraft,itemCraft,itemCraft]]);
			recipes.addShapeless(itemCraft,[Mstair]);
		}
	}
}

/*
val recipeMapErraseShaped = {
	// : [[,,],[,,],[,,]],
} as IIngredient[][][IItemStack];

for key,recipe in recipeMapErraseShaped {
	recipes.remove(key);
    recipes.addShaped(key, recipe);
}

val recipeMapErraseShapedLarger = {
	
} as IIngredient[][][IItemStack];

for key,recipe in recipeMapErraseShapedLarger {
	recipes.remove(key);
    mods.extendedcrafting.TableCrafting.addShaped(key,recipe);
}

val recipeMapErraseShapeless = {
	
} as IIngredient[][IItemStack];

for key,recipe in recipeMapErraseShapeless {
    recipes.remove(key);
	recipes.addShapeless(key, recipe);
}

val recipeMapAddShaped = {
 	// : [[,,],[,,],[,,]],
} as IIngredient[][][IItemStack];

for key,recipe in recipeMapAddShaped {
    recipes.addShaped(key, recipe);
}
*/
val recipeMapAddShapeless = {
	<minecraft:cobblestone>*2 : [<ore:cobblestone>, <ore:cobblestone>]
} as IIngredient[][IItemStack];

for key,recipe in recipeMapAddShapeless {
    recipes.addShapeless(key, recipe);
}

print("############################_End of Recipe_############################");