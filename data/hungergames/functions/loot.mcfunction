# loot based on chest

# RATING
# 0 - COPPER
# 1 - IRON
# 2 - GOLD
# 3 - DIAMOND
# 4 - NETHERITE


# Commented out method will only spawn items in the top left, with the new method randomly arranging the items

# 0
execute as @e[tag=r0] at @s run data merge block ~ ~-2 ~ {LootTable:"hungergames:chests/copper"}
#execute as @e[tag=r0] at @s run loot insert ~ ~-2 ~ loot hungergames:chests/copper

# 1
execute as @e[tag=r1] at @s run data merge block ~ ~-2 ~ {LootTable:"hungergames:chests/iron"}
#execute as @e[tag=r1] at @s run loot insert ~ ~-2 ~ loot hungergames:chests/iron

# 2
execute as @e[tag=r2] at @s run data merge block ~ ~-2 ~ {LootTable:"hungergames:chests/gold"}
#execute as @e[tag=r2] at @s run loot insert ~ ~-2 ~ loot hungergames:chests/gold

# 3
execute as @e[tag=r3] at @s run data merge block ~ ~-2 ~ {LootTable:"hungergames:chests/diamond"}
#execute as @e[tag=r3] at @s run loot insert ~ ~-2 ~ loot hungergames:chests/diamond

# 4
execute as @e[tag=r4] at @s run data merge block ~ ~-2 ~ {LootTable:"hungergames:chests/netherite"}
#execute as @e[tag=r4] at @s run loot insert ~ ~-2 ~ loot hungergames:chests/netherite

title @a actionbar {"text":"LOOTED ALL CHESTS!","color":"green","bold":true}
execute if entity @e[tag=r4] run tellraw @a {"text":"A netherite-rated chest has been found on the map, this is not natively supported.","color":"red"}