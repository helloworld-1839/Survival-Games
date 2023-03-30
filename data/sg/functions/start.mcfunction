# SG start


scoreboard players set can_start internal 0
scoreboard players set can_start_players internal 0
scoreboard players set can_start_period internal 0
scoreboard players set can_start_teams internal 0

# player check
function fm:players/count
execute if score players internal matches 2.. run scoreboard players set can_start_players internal 1
execute unless score can_start_players internal matches 1.. run tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"X","color":"red","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Cannot start, at least 2 players required.","color":"red"}]
# period check
execute if score period internal matches -1 run scoreboard players set can_start_period internal 1
execute unless score can_start_period internal matches 1.. run tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"X","color":"red","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Cannot start, a game is already in progress.","color":"red"}]
# teams check
# execute if score teams global matches 1.. if entity @a[team=red] if entity @a[team=blue] unless entity @a[team=!red,team=!blue] run scoreboard players set can_start_teams internal 1
# execute unless score teams global matches 1.. run scoreboard players set can_start_teams internal 1
# execute unless score can_start_teams internal matches 1.. run tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"X","color":"red","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Cannot start, at least 1 player on each team is required.","color":"red"}]

# teams check 2 - probably a better way to do it but my brain is too small
execute if score teams global matches 1.. if entity @a[team=red] if entity @a[team=!red] run scoreboard players set can_start_teams internal 1
execute if score teams global matches 1.. if entity @a[team=yellow] if entity @a[team=!yellow] run scoreboard players set can_start_teams internal 1
execute if score teams global matches 1.. if entity @a[team=green] if entity @a[team=!green] run scoreboard players set can_start_teams internal 1
execute if score teams global matches 1.. if entity @a[team=blue] if entity @a[team=!blue] run scoreboard players set can_start_teams internal 1
execute if score teams global matches 1.. if entity @a[team=!red,team=!blue,team=!yellow,team=!green] run scoreboard players set can_start_teams internal 0

execute unless score teams global matches 1.. run scoreboard players set can_start_teams internal 1
execute unless score can_start_teams internal matches 1.. run tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"X","color":"red","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Cannot start, at least 1 player on at least 2 different teams is required","color":"red"}]

execute if score can_start_players internal matches 1.. if score can_start_period internal matches 1.. if score can_start_teams internal matches 1.. run scoreboard players set can_start internal 1

# can start?
## yes, proceed to main start
execute if score can_start internal matches 1.. run function sg:start_c
## no, ineligible
execute unless score can_start internal matches 1.. run playsound minecraft:block.note_block.bass player @a