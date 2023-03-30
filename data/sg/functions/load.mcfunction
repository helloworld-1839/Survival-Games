# SG /reload


# scoreboards
scoreboard objectives add global dummy
scoreboard objectives add internal dummy
scoreboard objectives add death deathCount
scoreboard objectives add kills playerKillCount

# track spectator height
scoreboard objectives add spectator_height dummy

# teams
## red
team add red
team modify red color red
## blue
team add blue
team modify blue color blue

## yellow
team add yellow
team modify yellow color yellow

## green
team add green
team modify green color green



execute unless score defaults internal matches 1.. run function sg:defaults