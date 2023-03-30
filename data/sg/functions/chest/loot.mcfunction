# loot based on chest
## tiers are stored using entity tags


# normal
## tier 0
execute if score mode global matches 0 as @e[tag=chest_tier,tag=chest_tier.0] at @s run data merge block ~ ~-2 ~ {LootTable:"sg:chests/tier_0", CustomName:'{"text":"Normal Copper Chest"}'}
## tier 1
execute if score mode global matches 0 as @e[tag=chest_tier,tag=chest_tier.1] at @s run data merge block ~ ~-2 ~ {LootTable:"sg:chests/tier_1", CustomName:'{"text":"Normal Iron Chest"}'}
## tier 2
execute if score mode global matches 0 as @e[tag=chest_tier,tag=chest_tier.2] at @s run data merge block ~ ~-2 ~ {LootTable:"sg:chests/tier_2", CustomName:'{"text":"Normal Gold Chest"}'}
## tier 3
execute if score mode global matches 0 as @e[tag=chest_tier,tag=chest_tier.3] at @s run data merge block ~ ~-2 ~ {LootTable:"sg:chests/tier_3", CustomName:'{"text":"Normal Diamond Chest"}'}

# boosted
## tier 0
execute if score mode global matches 1 as @e[tag=chest_tier,tag=chest_tier.0] at @s run data merge block ~ ~-2 ~ {LootTable:"sg:chests/boosted/tier_0", CustomName:'{"text":"Boosted Copper Chest"}'}
## tier 1
execute if score mode global matches 1 as @e[tag=chest_tier,tag=chest_tier.1] at @s run data merge block ~ ~-2 ~ {LootTable:"sg:chests/boosted/tier_1", CustomName:'{"text":"Boosted Iron Chest"}'}
## tier 2
execute if score mode global matches 1 as @e[tag=chest_tier,tag=chest_tier.2] at @s run data merge block ~ ~-2 ~ {LootTable:"sg:chests/boosted/tier_2", CustomName:'{"text":"Boosted Gold Chest"}'}
## tier 3
execute if score mode global matches 1 as @e[tag=chest_tier,tag=chest_tier.3] at @s run data merge block ~ ~-2 ~ {LootTable:"sg:chests/boosted/tier_3", CustomName:'{"text":"Boosted Diamond Chest"}'}

# epic
## tier 0
execute if score mode global matches 2 as @e[tag=chest_tier,tag=chest_tier.0] at @s run data merge block ~ ~-2 ~ {LootTable:"sg:chests/epic/tier_0", CustomName:'{"text":"Epic Copper Chest"}'}
## tier 1
execute if score mode global matches 2 as @e[tag=chest_tier,tag=chest_tier.1] at @s run data merge block ~ ~-2 ~ {LootTable:"sg:chests/epic/tier_1", CustomName:'{"text":"Epic Iron Chest"}'}
## tier 2
execute if score mode global matches 2 as @e[tag=chest_tier,tag=chest_tier.2] at @s run data merge block ~ ~-2 ~ {LootTable:"sg:chests/epic/tier_2", CustomName:'{"text":"Epic Gold Chest"}'}
## tier 3
execute if score mode global matches 2 as @e[tag=chest_tier,tag=chest_tier.3] at @s run data merge block ~ ~-2 ~ {LootTable:"sg:chests/epic/tier_3", CustomName:'{"text":"Epic Diamond Chest"}'}


execute if score debug internal matches 1.. run title @a actionbar {"text":"LOOTED ALL CHESTS!","color":"green","bold":true}