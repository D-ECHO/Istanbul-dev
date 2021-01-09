case $1 in
	1) geo='--min-lon=28.5 --max-lon=29.5 --min-lat=40.75 --max-lat=41.5';;		# Istanbul (LTFM, LTBA, LTFJ, (LTBX))
	2) geo='--min-lon=30.0 --max-lon=31.0 --min-lat=36.5 --max-lat=37.25';;		# Antalya (LTAI)				!! regenerate (no roads)
	3) geo='--min-lon=26.75 --max-lon=27.5 --min-lat=38.0 --max-lat=38.75';;	# Izmir (LTBJ, LTBK, LTFA, LTBL)		!! regenerate (no roads)
	4) geo='--min-lon=35.0 --max-lon=35.5 --min-lat=36.75 --max-lat=37.25';;	# Adana (LTAF, LTAG)
	5) geo='--min-lon=27.5 --max-lon=28.0 --min-lat=37.125 --max-lat=37.375';;	# Milas/Bodrum (LTFE, LTBV)
	6) geo='--min-lon=28.0 --max-lon=29.5 --min-lat=36.5 --max-lat=37.0';;		# Dalaman (LTBS)
	7) geo='--min-lon=32.25 --max-lon=33.25 --min-lat=39.75 --max-lat=40.25';;	# Ankara (LTAB, LTAC, LTAD, LTAE)		!! regenerate (airports missing)
	8) geo='--min-lon=37.0 --max-lon=37.75 --min-lat=36.75 --max-lat=37.25';;	# Gaziantep (LTAJ)
	9) geo='--min-lon=39.5 --max-lon=40.0 --min-lat=40.75 --max-lat=41.25';;	# Trabzon (LTCG)
esac
echo $1
echo $geo
if [ ! -z "$2" ]  && [ $2 = "light" ]
then
	echo "Light built: Not building Freeway, Road, Asphalt, Railroad, Strem";
	arg="";
else
	arg="Freeway Road Asphalt Railroad Stream";
fi
tg-construct --work-dir=./work --output-dir=./output/Terrain `echo $geo` --threads=3 --priorities=priorities.txt AirportArea SRTM-3 AirportObj Default Ocean Hole Road-Motorway Road-Trunk Road-Residential Road-Primary Road-Secondary Road-Tertiary Road-Service Road-Pedestrian Road-Steps Road-Unclassified Airport Pond Lake DryLake Reservoir IntermittentLake IntermittentStream Watercourse Canal Cliffs Glacier PackIce PolarIce Ocean Estuary Urban SubUrban Town Fishing Construction Industrial Port Dump FloodLand Lagoon Bog Marsh SaltMarsh Sand Saline Littoral Dirt Rock Lava OpenMining BuiltUpCover Transport Cemetery DryCrop IrrCrop Rice MixedCrop Vineyard Bamboo Mangrove ComplexCrop NaturalCrop CropGrass CropWood AgroForest Olives GolfCourse Greenspace GrassCover Grassland ScrubCover Scrub ShrubGrassCover SavannaCover Orchard DeciduousForest DeciduousBroadCover EvergreenForest EvergreenBroadCover MixedForest RainForest BarrenCover HerbTundra Sclerophyllous Heath Burnt SnowCover Island Default Void Null Unknown River $arg
