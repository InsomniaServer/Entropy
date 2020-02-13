#modloaded magneticraft
import crafttweaker.item.IIngredient;

val FurnaceRemove = {
	<minecraft:iron_ingot> : [<minecraft:iron_ore>,<actuallyadditions:item_misc:20>,<magneticraft:rocky_chunks>,<magneticraft:chunks>,],
	<minecraft:gold_ingot> : [<minecraft:gold_ore>,<magneticraft:rocky_chunks>,<magneticraft:chunks>,],
	<tconstruct:ingots> : [<tconstruct:ore>,],
	<tconstruct:ingots:1> : [<tconstruct:ore:1>,],
	<magneticraft:ingots:4> : [<magneticraft:ores:2>,<magneticraft:rocky_chunks:4>,<magneticraft:chunks:4>,],
	<magneticraft:ingots:5> : [<magneticraft:ores:3>,<magneticraft:rocky_chunks:5>,<magneticraft:chunks:5>,],
	<magneticraft:ingots:9> : [<magneticraft:rocky_chunks:9>,<magneticraft:chunks:9>,],
	<magneticraft:ingots:11> : [<magneticraft:rocky_chunks:11>,<magneticraft:chunks:11>,],
	<magneticraft:ingots:14> : [<magneticraft:rocky_chunks:14>,<magneticraft:chunks:14>,],
	<ore:ingotSilver> : [<magneticraft:rocky_chunks:12>,<magneticraft:chunks:12>,],
	<ore:ingotAluminum> : [<magneticraft:rocky_chunks:7>,<magneticraft:chunks:7>,],
} as IIngredient[][IIngredient] ;

for item,items in FurnaceRemove {
	if isNull(items[0]) {
		furnace.remove(item) ;
	} else {
		for input in items {
			furnace.remove(item,input);
		}
	}
}