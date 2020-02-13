import mods.chisel.Carving;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IItemDefinition;
import crafttweaker.oredict.IOreDictEntry;

var i as int;

val chiselNGroups = [
	"etheticQuartz",
	"etheticGreen",
	"ruby",
	"sapphire",
	"peridot",
	"electrotine",
	"black_granite",
	"Rhyolite",
	"gabbro",
	"komatiite",
	"dacite",
	"gneiss",
	"eclogite",
	"quartzite",
	"blue_schist",
	"green_schist",
	"soapstone",
	"migmatite",
	"chalk",
	"shale",
	"siltstone",
	"lignite",
	"dolomite",
	"greywacke",
	"chert",
] as string[];

for group in chiselNGroups {
	mods.chisel.Carving.addGroup(group);
}

val chiselAdd = {
    "limestone": [<magneticraft:limestone>,<magneticraft:limestone:1>,<magneticraft:limestone:2>,<magneticraft:burnt_limestone>,<magneticraft:burnt_limestone:2>,<magneticraft:burnt_limestone:1>,<magneticraft:tile_limestone>,<magneticraft:tile_limestone:1>],
	"marble":[<projectred-exploration:stone_wall:1>,<projectred-exploration:stone_wall>],
	"basalt" : [<projectred-exploration:stone_wall:2>,<projectred-exploration:stone_wall:3>,<projectred-exploration:stone_wall:4>],
	"cobblestone": [
		<undergroundbiomes:igneous_cobble>,<undergroundbiomes:igneous_cobble:1>,<undergroundbiomes:igneous_cobble:2>,<undergroundbiomes:igneous_cobble:3>,<undergroundbiomes:igneous_cobble:4>,<undergroundbiomes:igneous_cobble:5>,<undergroundbiomes:igneous_cobble:6>,<undergroundbiomes:igneous_cobble:7>,<minecraft:cobblestone_wall>,
		<undergroundbiomes:metamorphic_cobble>,<undergroundbiomes:metamorphic_cobble:1>,<undergroundbiomes:metamorphic_cobble:2>,<undergroundbiomes:metamorphic_cobble:3>,<undergroundbiomes:metamorphic_cobble:4>,<undergroundbiomes:metamorphic_cobble:5>,<undergroundbiomes:metamorphic_cobble:6>,<undergroundbiomes:metamorphic_cobble:7>,
	],
	"cobblestonemossy": [
		<undergroundbiomes:igneous_cobble_mossy>,<undergroundbiomes:igneous_cobble_mossy:1>,<undergroundbiomes:igneous_cobble_mossy:2>,<undergroundbiomes:igneous_cobble_mossy:3>,<undergroundbiomes:igneous_cobble_mossy:4>,<undergroundbiomes:igneous_cobble_mossy:5>,<undergroundbiomes:igneous_cobble_mossy:6>,<undergroundbiomes:igneous_cobble_mossy:7>,<minecraft:cobblestone_wall:1>,
		<undergroundbiomes:metamorphic_cobble_mossy>,<undergroundbiomes:metamorphic_cobble_mossy:1>,<undergroundbiomes:metamorphic_cobble_mossy:2>,<undergroundbiomes:metamorphic_cobble_mossy:3>,<undergroundbiomes:metamorphic_cobble_mossy:4>,<undergroundbiomes:metamorphic_cobble_mossy:5>,<undergroundbiomes:metamorphic_cobble_mossy:6>,<undergroundbiomes:metamorphic_cobble_mossy:7>,
	],
	"etheticQuartz":[<actuallyadditions:block_testifi_bucks_white_fence>,<actuallyadditions:block_testifi_bucks_white_wall>],
	"etheticGreen":[<actuallyadditions:block_testifi_bucks_green_fence>,<actuallyadditions:block_testifi_bucks_green_wall>],
	"ruby":[<projectred-exploration:stone:5>,<projectred-exploration:stone_wall:5>],
	"sapphire":[<projectred-exploration:stone:6>,<projectred-exploration:stone_wall:6>],
	"peridot":[<projectred-exploration:stone:7>,<projectred-exploration:stone_wall:7>],
	"electrotine":[<projectred-exploration:stone:11>,<projectred-exploration:stone_wall:11>],
} as IItemStack[][string];

for group ,items in chiselAdd {
    for item in items {
        mods.chisel.Carving.addVariation(group, item);
    }
}

var ore = oreDict.get("etheticQuartz") as IOreDictEntry ;
ore.add(<actuallyadditions:block_testifi_bucks_white_fence>);
mods.chisel.Carving.addVariation("etheticQuartz", <actuallyadditions:block_testifi_bucks_white_fence>);
mods.chisel.Carving.addVariation("etheticQuartz", <actuallyadditions:block_testifi_bucks_white_wall>);

val undergroundTypeGroup = {
	"igneous":["granite","black_granite","Rhyolite","andesite","gabbro","basalt","komatiite","dacite"],
	"metamorphic":["gneiss","eclogite","marble","quartzite","blue_schist","green_schist","soapstone","migmatite"],
	"sedimentary":["limestone","chalk","shale","siltstone","lignite","dolomite","greywacke","chert"],
} as string[][string];

val undergroundTypeBlock = {
	"igneous": [<undergroundbiomes:igneous_stone>,<undergroundbiomes:igneous_brick>,<undergroundbiomes:igneous_stone_wall>,<undergroundbiomes:igneous_brick_wall>],
	"metamorphic":[<undergroundbiomes:metamorphic_stone>,<undergroundbiomes:metamorphic_brick>,<undergroundbiomes:metamorphic_stone_wall>,<undergroundbiomes:metamorphic_brick_wall>],
	"sedimentary":[<undergroundbiomes:sedimentary_stone>,<undergroundbiomes:sedimentary_stone_wall>],
} as IItemStack[][string];

for key, groups in undergroundTypeGroup {
	i=0;
	for group in groups {
		for block in undergroundTypeBlock[key] {
			mods.chisel.Carving.addVariation(group, block.definition.makeStack(i));
		}
		i=i+1;
	}
}

val UndergroundTypeConvert = {
	"sandstone" : [<undergroundbiomes:igneous_sandstone>,<undergroundbiomes:metamorphic_sandstone>,<undergroundbiomes:sedimentary_sandstone>,],
	"smoothSandstone":[<undergroundbiomes:igneous_sandstone_smooth>,<undergroundbiomes:metamorphic_sandstone_smooth>,<undergroundbiomes:sedimentary_sandstone_smooth>,],
	"chiseledSandstone":[<undergroundbiomes:igneous_sandstone_chiseled>,<undergroundbiomes:metamorphic_sandstone_chiseled>,<undergroundbiomes:sedimentary_sandstone_chiseled>,],
} as IItemStack[][string] ;

for group,items in UndergroundTypeConvert {
	for item in items {
		for i in 0 to 8 {
			mods.chisel.Carving.addVariation(group, item.definition.makeStack(i));
		}
	}
}


