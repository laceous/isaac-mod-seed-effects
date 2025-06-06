local mod = RegisterMod('Seed Effects', 1)
local json = require('json')
local game = Game()
local music = MusicManager()

mod.order = {
              {
                title = 'Misc',
                list = {
                         SeedEffect.SEED_INFINITE_BASEMENT,                 -- 16
                         SeedEffect.SEED_PICKUPS_SLIDE,                     -- 11
                         SeedEffect.SEED_PICKUPS_TIMEOUT,                   -- 72
                         SeedEffect.SEED_ITEMS_COST_MONEY,                  -- 33
                         SeedEffect.SEED_PACIFIST,                          -- 25
                         SeedEffect.SEED_ENEMIES_RESPAWN,                   -- 32
                         SeedEffect.SEED_NO_BOSS_ROOM_EXITS,                -- 71
                         SeedEffect.SEED_POOP_TRAIL,                        -- 24
                         SeedEffect.SEED_INVINCIBLE,                        -- 73
                         SeedEffect.SEED_KIDS_MODE,                         -- 55
                      }
              },
              {
                title = 'Curse 1',
                list = {
                         SeedEffect.SEED_PERMANENT_CURSE_DARKNESS,          -- 56
                         SeedEffect.SEED_PERMANENT_CURSE_LABYRINTH,         -- 57
                         SeedEffect.SEED_PERMANENT_CURSE_LOST,              -- 58
                         SeedEffect.SEED_PERMANENT_CURSE_UNKNOWN,           -- 59
                         SeedEffect.SEED_PERMANENT_CURSE_MAZE,              -- 60
                         SeedEffect.SEED_PERMANENT_CURSE_BLIND,             -- 61
                         SeedEffect.SEED_PERMANENT_CURSE_CURSED,            -- 62
                       }
              },
              {
                title = 'Curse 2',
                list = {
                         SeedEffect.SEED_PREVENT_CURSE_DARKNESS,            -- 63
                         SeedEffect.SEED_PREVENT_CURSE_LABYRINTH,           -- 64
                         SeedEffect.SEED_PREVENT_CURSE_LOST,                -- 65
                         SeedEffect.SEED_PREVENT_CURSE_UNKNOWN,             -- 66
                         SeedEffect.SEED_PREVENT_CURSE_MAZE,                -- 67
                         SeedEffect.SEED_PREVENT_CURSE_BLIND,               -- 68
                         SeedEffect.SEED_PREVENT_ALL_CURSES,                -- 70
                       }
              },
              {
                title = 'Damage',
                list = {
                         SeedEffect.SEED_ISAAC_TAKES_HIGH_DAMAGE,           -- 47
                         SeedEffect.SEED_ISAAC_TAKES_MASSIVE_DAMAGE,        -- 48
                         SeedEffect.SEED_DAMAGE_WHEN_STOPPED,               -- 26
                         SeedEffect.SEED_DAMAGE_ON_INTERVAL,                -- 27
                         SeedEffect.SEED_DAMAGE_ON_TIME_LIMIT,              -- 28
                       }
              },
              {
                title = 'Controls',
                list = {
                         SeedEffect.SEED_ICE_PHYSICS,                       -- 52
                         SeedEffect.SEED_SHOOT_IN_MOVEMENT_DIRECTION,       -- 74
                         SeedEffect.SEED_SHOOT_OPPOSITE_MOVEMENT_DIRECTION, -- 75
                         SeedEffect.SEED_CONTROLS_REVERSED,                 -- 12
                         SeedEffect.SEED_AXIS_ALIGNED_CONTROLS,             -- 76
                       }
              },
              {
                title = 'Camo',
                list = {
                         SeedEffect.SEED_CAMO_ISAAC,                        -- 3
                         SeedEffect.SEED_CAMO_ENEMIES,                      -- 4
                         SeedEffect.SEED_CAMO_PICKUPS,                      -- 5
                         SeedEffect.SEED_CAMO_EVERYTHING,                   -- 6
                         SeedEffect.SEED_INVISIBLE_ISAAC,                   -- 14
                         SeedEffect.SEED_INVISIBLE_ENEMIES,                 -- 15
                       }
              },
              {
                title = 'Appearance',
                list = {
                         SeedEffect.SEED_NO_FACE,                           -- 46
                         SeedEffect.SEED_KAPPA,                             -- 53
                         SeedEffect.SEED_CHRISTMAS,                         -- 54
                         SeedEffect.SEED_BIG_HEAD,                          -- 35
                         SeedEffect.SEED_SMALL_HEAD,                        -- 36
                         SeedEffect.SEED_BLACK_ISAAC,                       -- 37
                         -1,
                         SeedEffect.SEED_GLOWING_TEARS,                     -- 38
                         SeedEffect.SEED_EXTRA_BLOOD,                       -- 23
                       }
              },
              {
                title = 'HUD',
                list = {
                         SeedEffect.SEED_OLD_TV,                            -- 8
                         SeedEffect.SEED_DYSLEXIA,                          -- 9
                         SeedEffect.SEED_NO_HUD,                            -- 10
                         SeedEffect.SEED_PILLS_NEVER_IDENTIFY,              -- 29
                         SeedEffect.SEED_MYSTERY_TAROT_CARDS,               -- 30
                       }
              },
              {
                title = 'Enemies',
                list = {
                         SeedEffect.SEED_ALL_CHAMPIONS,                     -- 13
                         SeedEffect.SEED_ALWAYS_CHARMED,                    -- 17
                         SeedEffect.SEED_ALWAYS_CONFUSED,                   -- 18
                         SeedEffect.SEED_ALWAYS_AFRAID,                     -- 19
                         SeedEffect.SEED_ALWAYS_ALTERNATING_FEAR,           -- 20
                         SeedEffect.SEED_ALWAYS_CHARMED_AND_AFRAID,         -- 21
                       }
              },
              {
                title = 'Sound',
                list = {
                         SeedEffect.SEED_FART_SOUNDS,                       -- 7
                         -1,
                         SeedEffect.SEED_MOVEMENT_PITCH,                    -- 1
                         SeedEffect.SEED_HEALTH_PITCH,                      -- 2
                         SeedEffect.SEED_SLOW_MUSIC,                        -- 41
                         SeedEffect.SEED_ULTRA_SLOW_MUSIC,                  -- 42
                         SeedEffect.SEED_FAST_MUSIC,                        -- 43
                         SeedEffect.SEED_ULTRA_FAST_MUSIC,                  -- 44
                       }
              },
              {
                title = 'Ref', -- the wiki lists this as "Video Games?"
                list = {
                         SeedEffect.SEED_SUPER_HOT,                         -- 77
                         SeedEffect.SEED_RETRO_VISION,                      -- 78
                         SeedEffect.SEED_G_FUEL                             -- 79
                       }
              }
            }

mod.data = {
             [SeedEffect.SEED_INFINITE_BASEMENT]                 = { name = 'Infinite Basements'    , achievements = false, info = { 'BASE MENT', 'Disables achievements' } },
             [SeedEffect.SEED_PICKUPS_SLIDE]                     = { name = 'Tricky pickups'        , achievements = false, info = { 'KEEP AWAY', 'Disables achievements' } },
             [SeedEffect.SEED_PICKUPS_TIMEOUT]                   = { name = 'Pickups time out'      , achievements = true , info = { 'G0NE S00N' } },
             [SeedEffect.SEED_ITEMS_COST_MONEY]                  = { name = 'F2P version'           , achievements = false, info = { 'FREE 2PAY', 'Disables achievements', 'Item prices are set when the item is spawned' }, helpMarkerIdx = 3,
                add = function()
                  -- for now, prices will stay whatever they were when the item was spawned
                  -- maybe look further into dynamically updating prices?
                  -- it might be hard to differentiate between all the different use cases
                  -- inital testing shows some buggy behavior: AutoUpdatePrice can update prices to 99c
                  mod:add69Coins()
                end
             },
             [SeedEffect.SEED_PACIFIST]                          = { name = 'Pacifism'              , achievements = false, info = { 'PAC1 F1SM', 'Disables achievements' } },
             [SeedEffect.SEED_ENEMIES_RESPAWN]                   = { name = 'Enemies respawn'       , achievements = false, info = { 'C0ME BACK', 'Disables achievements' } },
             [SeedEffect.SEED_NO_BOSS_ROOM_EXITS]                = { name = 'Point of no return'    , achievements = true , info = { 'N0RE TVRN', 'In boss rooms, the room may be reloaded' }, helpMarkerIdx = 2,
                add = function()
                  if mod:shouldReloadBossRoom() then
                    mod.doReloadRoom = true
                  end
                end,
                remove = function()
                  if mod:shouldReloadBossRoom() then
                    mod.doReloadRoom = true
                  end
                end
             },
             [SeedEffect.SEED_POOP_TRAIL]                        = { name = 'Poopy Trail'           , achievements = false, info = { 'BRWN SNKE', 'Disables achievements' } },
             [SeedEffect.SEED_INVINCIBLE]                        = { name = 'Dog Mode'              , achievements = false, info = { 'ALM1 GHTY', 'Disables achievements' } },
             [SeedEffect.SEED_KIDS_MODE]                         = { name = 'Kids\' co-op mode'     , achievements = false, info = { 'K1DS M0DE', 'Disables achievements' } },
             [SeedEffect.SEED_PERMANENT_CURSE_DARKNESS]          = { name = 'Permanent Darkness'    , achievements = true , info = { 'DARK NESS' } },
             [SeedEffect.SEED_PERMANENT_CURSE_LABYRINTH]         = { name = 'Inescapable Labyrinth' , achievements = false, info = { 'LABY RNTH', 'Disables achievements', 'If XL state changes, the level will be reloaded' }, helpMarkerIdx = 3 },
             [SeedEffect.SEED_PERMANENT_CURSE_LOST]              = { name = 'Hopelessly Lost'       , achievements = true , info = { 'L0ST' } },
             [SeedEffect.SEED_PERMANENT_CURSE_UNKNOWN]           = { name = 'Forever Unknown'       , achievements = true , info = { 'VNKN 0WN' } },
             [SeedEffect.SEED_PERMANENT_CURSE_MAZE]              = { name = 'Unending Maze'         , achievements = true , info = { 'MAZE' } },
             [SeedEffect.SEED_PERMANENT_CURSE_BLIND]             = { name = 'Incurable Blindness'   , achievements = true , info = { 'BL1N D', 'If there\'s an item, the room may be reloaded' }, helpMarkerIdx = 2 },
             [SeedEffect.SEED_PERMANENT_CURSE_CURSED]            = { name = 'Horrible Curse'        , achievements = true , info = { 'CVRS ED', 'If doors need an update, the room will be reloaded' }, helpMarkerIdx = 2 },
             [SeedEffect.SEED_PREVENT_CURSE_DARKNESS]            = { name = 'Illuminate Darkness'   , achievements = false, info = { 'N1TE L1TE', 'Disables achievements' } },
             [SeedEffect.SEED_PREVENT_CURSE_LABYRINTH]           = { name = 'Escape the Labyrinth'  , achievements = false, info = { 'THRE AD', 'Disables achievements', 'If XL state changes, the level will be reloaded' }, helpMarkerIdx = 3 },
             [SeedEffect.SEED_PREVENT_CURSE_LOST]                = { name = 'I once was Lost'       , achievements = false, info = { 'F0VN D', 'Disables achievements' } },
             [SeedEffect.SEED_PREVENT_CURSE_UNKNOWN]             = { name = 'Know the Unknown'      , achievements = false, info = { 'N0W1 KN0W', 'Disables achievements' } },
             [SeedEffect.SEED_PREVENT_CURSE_MAZE]                = { name = 'Stay out of the Maze'  , achievements = false, info = { 'PATH F1ND', 'Disables achievements' } },
             [SeedEffect.SEED_PREVENT_CURSE_BLIND]               = { name = 'Heal the Blind'        , achievements = false, info = { 'BRA1 LLE', 'Disables achievements', 'If there\'s an item, the room may be reloaded' }, helpMarkerIdx = 3 },
             [SeedEffect.SEED_PREVENT_ALL_CURSES]                = { name = 'Total curse Immunity'  , achievements = false, info = { 'BLCK CNDL', 'Disables achievements', 'The level or room may be reloaded' }, helpMarkerIdx = 3 },
             [SeedEffect.SEED_ISAAC_TAKES_HIGH_DAMAGE]           = { name = 'Full heart damage'     , achievements = true , info = { 'HARD HARD' } },
             [SeedEffect.SEED_ISAAC_TAKES_MASSIVE_DAMAGE]        = { name = 'Twelve heart damage'   , achievements = true , info = { 'BRTL B0NS' } },
             [SeedEffect.SEED_DAMAGE_WHEN_STOPPED]               = { name = 'Don\'t stop moving'    , achievements = true , info = { 'D0NT ST0P' } },
             [SeedEffect.SEED_DAMAGE_ON_INTERVAL]                = { name = 'Damage on a timer'     , achievements = true , info = { 'THEG H0ST' } },
             [SeedEffect.SEED_DAMAGE_ON_TIME_LIMIT]              = { name = '30 minute limit'       , achievements = true , info = { '30M1 N1TS' } },
             [SeedEffect.SEED_ICE_PHYSICS]                       = { name = 'Ice Physics'           , achievements = true , info = { '1CES KATE' } },
             [SeedEffect.SEED_SHOOT_IN_MOVEMENT_DIRECTION]       = { name = 'Bravery'               , achievements = true , info = { 'BRAV ERY' } },
             [SeedEffect.SEED_SHOOT_OPPOSITE_MOVEMENT_DIRECTION] = { name = 'Cowardice'             , achievements = true , info = { 'C0WR D1CE' } },
             [SeedEffect.SEED_CONTROLS_REVERSED]                 = { name = 'Reversed controls'     , achievements = true , info = { 'DRAW KCAB' } },
             [SeedEffect.SEED_AXIS_ALIGNED_CONTROLS]             = { name = 'Axis aligned controls' , achievements = true , info = { 'AX1S ALGN' } },
             [SeedEffect.SEED_CAMO_ISAAC]                        = { name = 'Camouflage player'     , achievements = true , info = { 'CAM0 K1DD' },
                remove = function()
                  -- evalPlayerCache doesn't work here
                  mod:removeCamo(EntityType.ENTITY_PLAYER, false)
                end
             },
             [SeedEffect.SEED_CAMO_ENEMIES]                      = { name = 'Camouflage enemies'    , achievements = true , info = { 'CAM0 F0ES' },
                remove = function()
                  mod:removeCamo(nil, true)
                end
             },
             [SeedEffect.SEED_CAMO_PICKUPS]                      = { name = 'Camouflage stuff'      , achievements = true , info = { 'CAM0 DR0P' },
                remove = function()
                  mod:removeCamo(EntityType.ENTITY_PICKUP, false)
                end
             },
             [SeedEffect.SEED_CAMO_EVERYTHING]                   = { name = 'Camouflage EVERYTHING!', achievements = true , info = { 'WH0A WHAT' },
                remove = function()
                  mod:removeCamo(nil, false)
                end
             },
             [SeedEffect.SEED_INVISIBLE_ISAAC]                   = { name = 'Invisible player'      , achievements = true , info = { '1MN0 B0DY' },
                remove = function()
                  mod:evalPlayerCache()
                end
             },
             [SeedEffect.SEED_INVISIBLE_ENEMIES]                 = { name = 'Invisible enemies'     , achievements = true , info = { 'BL1N DEYE' },
                remove = function()
                  mod:removeCamo(nil, true)
                end
             },
             [SeedEffect.SEED_NO_FACE]                           = { name = 'The Blank'             , achievements = true , info = { 'THEB LANK' },
                add = function()
                  mod:addNullCostume(NullItemID.ID_BLANKFACE)
                end,
                remove = function()
                  mod:removeNullCostume(NullItemID.ID_BLANKFACE)
                end
             },
             [SeedEffect.SEED_KAPPA]                             = { name = 'Grayscale'             , achievements = true , info = { 'KAPP A' },
                remove = function()
                  mod:evalPlayerCache()
                end
             },
             [SeedEffect.SEED_CHRISTMAS]                         = { name = 'Christmas'             , achievements = true , info = { 'H0H0 H0H0' },
                add = function()
                  mod:addNullCostume(NullItemID.ID_CHRISTMAS)
                end,
                remove = function()
                  mod:removeNullCostume(NullItemID.ID_CHRISTMAS)
                end
             },
             [SeedEffect.SEED_BIG_HEAD]                          = { name = 'Big head mode'         , achievements = true , info = { 'T0PH EAVY' },
                add = function()
                  mod:evalPlayerCache()
                end,
                remove = function()
                  mod:evalPlayerCache()
                end
             },
             [SeedEffect.SEED_SMALL_HEAD]                        = { name = 'Tiny head mode'        , achievements = true , info = { 'T1NY D0ME' },
                add = function()
                  mod:evalPlayerCache()
                end,
                remove = function()
                  mod:evalPlayerCache()
                end
             },
             [SeedEffect.SEED_BLACK_ISAAC]                       = { name = 'Black body'            , achievements = true , info = { 'PTCH BLCK' },
                remove = function()
                  mod:evalPlayerCache()
                end
             },
             [SeedEffect.SEED_GLOWING_TEARS]                     = { name = 'Glowing tears'         , achievements = false, info = { 'TEAR GL0W', 'Disables achievements' } },
             [SeedEffect.SEED_EXTRA_BLOOD]                       = { name = 'Extra Gore'            , achievements = true , info = { 'BL00 00DY' } },
             [SeedEffect.SEED_OLD_TV]                            = { name = 'Cathode rays!'         , achievements = true , info = { 'B00B T00B', 'Warning! Enabling this can crash the game!' }, helpMarkerIdx = 2 },
             [SeedEffect.SEED_DYSLEXIA]                          = { name = 'Dyslexia'              , achievements = true , info = { 'DYSL EX1A' } },
             [SeedEffect.SEED_NO_HUD]                            = { name = 'No HUD'                , achievements = true , info = { 'KEEP TRAK' } },
             [SeedEffect.SEED_PILLS_NEVER_IDENTIFY]              = { name = 'Mystery pills'         , achievements = true , info = { 'MED1 C1NE' } },
             [SeedEffect.SEED_MYSTERY_TAROT_CARDS]               = { name = 'Mystery cards'         , achievements = true , info = { 'FACE D0WN' } },
             [SeedEffect.SEED_ALL_CHAMPIONS]                     = { name = 'Champion enemies'      , achievements = false, info = { 'CHAM P10N', 'Disables achievements' } },
             [SeedEffect.SEED_ALWAYS_CHARMED]                    = { name = 'Charmed enemies'       , achievements = false, info = { 'C0CK FGHT', 'Disables achievements' } },
             [SeedEffect.SEED_ALWAYS_CONFUSED]                   = { name = 'Confused enemies'      , achievements = false, info = { 'C0NF ETT1', 'Disables achievements' } },
             [SeedEffect.SEED_ALWAYS_AFRAID]                     = { name = 'Scaredy enemies'       , achievements = false, info = { 'FEAR M1NT', 'Disables achievements' } },
             [SeedEffect.SEED_ALWAYS_ALTERNATING_FEAR]           = { name = 'Skittish enemies'      , achievements = false, info = { 'FRA1 DN0T', 'Disables achievements' } },
             [SeedEffect.SEED_ALWAYS_CHARMED_AND_AFRAID]         = { name = 'Asocial enemies'       , achievements = false, info = { 'CLST RPH0', 'Disables achievements' } },
             [SeedEffect.SEED_FART_SOUNDS]                       = { name = 'Farty sounds'          , achievements = true , info = { 'FART SNDS' } },
             [SeedEffect.SEED_MOVEMENT_PITCH]                    = { name = 'Movement tempo'        , achievements = true , info = { 'SL0W 4ME2' },
                remove = function()
                  music:PitchSlide(1)
                end
             },
             [SeedEffect.SEED_HEALTH_PITCH]                      = { name = 'Health tempo'          , achievements = true , info = { 'HART BEAT' },
                remove = function()
                  music:PitchSlide(1)
                end
             },
             [SeedEffect.SEED_SLOW_MUSIC]                        = { name = 'Downtempo'             , achievements = true , info = { 'ANDA NTE' } },
             [SeedEffect.SEED_ULTRA_SLOW_MUSIC]                  = { name = 'Downtempo--'           , achievements = true , info = { 'LARG HET0' } },
             [SeedEffect.SEED_FAST_MUSIC]                        = { name = 'Uptempo'               , achievements = true , info = { 'ALLE GR0' } },
             [SeedEffect.SEED_ULTRA_FAST_MUSIC]                  = { name = 'Uptempo++'             , achievements = true , info = { 'PRES T0' } },
             [SeedEffect.SEED_SUPER_HOT]                         = { name = 'Super Hot'             , achievements = false, info = { 'SVPE RH0T', 'Disables achievements' } },
             [SeedEffect.SEED_RETRO_VISION]                      = { name = 'Retro Vision'          , achievements = true , info = { 'M0DE SEVN' } },
             [SeedEffect.SEED_G_FUEL]                            = { name = 'G Fuel!'               , achievements = false, info = { 'GFVE LLLL', 'Disables achievements', 'Buggy! Hold R to restart after toggling!' }, helpMarkerIdx = 3 }
           }

mod.numSeedEffects = SeedEffect.NUM_SEEDS - 1
mod.doReloadRoom = false
mod.tempHasF2PCoins = false
mod.onGameStartHasRun = false

mod.state = {}
mod.state.hasF2PCoins = false -- GetPtrHash(player) doesn't work on continue so making this a singular check

function mod:onGameStart(isContinue)
  if mod:HasData() and isContinue then
    local _, state = pcall(json.decode, mod:LoadData())
    
    if type(state) == 'table' then
      if type(state.hasF2PCoins) == 'boolean' then
        mod.state.hasF2PCoins = state.hasF2PCoins
      end
    end
  end
  
  if mod.tempHasF2PCoins then
    mod.state.hasF2PCoins = mod.tempHasF2PCoins
    mod.tempHasF2PCoins = false
  end
  
  mod.onGameStartHasRun = true
end

function mod:onGameExit(shouldSave)
  if shouldSave then
    mod:SaveData(json.encode(mod.state))
    mod.state.hasF2PCoins = false
  else
    mod.state.hasF2PCoins = false
    mod:SaveData(json.encode(mod.state))
  end
  
  mod.doReloadRoom = false
  mod.tempHasF2PCoins = false
  mod.onGameStartHasRun = false
end

-- filtered to 0-Player
function mod:onPlayerInit(player)
  local seeds = game:GetSeeds()
  
  if seeds:HasSeedEffect(SeedEffect.SEED_ITEMS_COST_MONEY) then
    if mod.onGameStartHasRun then
      mod.state.hasF2PCoins = true
    else
      mod.tempHasF2PCoins = true
    end
  end
end

-- usage: seed-effects-disable-all
function mod:onExecuteCmd(cmd, parameters)
  cmd = string.lower(cmd)
  
  if cmd == 'seed-effects-disable-all' then
    if mod:isInGame() then
      local count = mod:disableAllSeedEffects()
      print('Seed effects disabled: ' .. count)
    end
  end
end

function mod:isInGame()
  if REPENTOGON then
    return Isaac.IsInGame()
  end
  
  return true
end

-- some seed effects aren't available/implemented
-- 22, 31, 34, 39, 40, 45, 49, 50, 51, 69
function mod:countSeedEffects()
  local count = 0
  for _, v in pairs(SeedEffect) do
    if v ~= SeedEffect.SEED_NORMAL and v ~= SeedEffect.NUM_SEEDS then
      count = count + 1
    end
  end
  
  return count
end

function mod:add69Coins()
  if not mod.state.hasF2PCoins then
    mod.state.hasF2PCoins = true
    
    for i = 0, game:GetNumPlayers() - 1 do
      local player = game:GetPlayer(i)
      local isBaby = player:GetBabySkin() ~= BabySubType.BABY_UNASSIGNED
      if not isBaby then
        player:AddCoins(69)
      end
    end
  end
end

function mod:addNullCostume(nullCostume)
  for i = 0, game:GetNumPlayers() - 1 do
    local player = game:GetPlayer(i)
    player:AddNullCostume(nullCostume)
  end
end

function mod:removeNullCostume(nullCostume)
  for i = 0, game:GetNumPlayers() - 1 do
    local player = game:GetPlayer(i)
    player:TryRemoveNullCostume(nullCostume)
  end
end

function mod:evalPlayerCache()
  for i = 0, game:GetNumPlayers() - 1 do
    local player = game:GetPlayer(i)
    player:AddCacheFlags(CacheFlag.CACHE_SIZE)
    player:AddCacheFlags(CacheFlag.CACHE_COLOR)
    player:EvaluateItems()
  end
end

-- sprite.Color is important to make this work for SEED_CAMO_ISAAC/remove
function mod:removeCamo(entityType, isEnemy)
  for _, v in ipairs(Isaac.GetRoomEntities()) do
    if (not entityType and not isEnemy) or v.Type == entityType or (isEnemy and v:IsEnemy()) then
      local sprite = v:GetSprite()
      local vColor = v.Color
      local sColor = sprite.Color
      if not (sColor.R == 1 and sColor.G == 1 and sColor.B == 1 and sColor.A == 1 and sColor.RO == vColor.RO and sColor.GO == vColor.GO and sColor.BO == vColor.BO) then
        v.Color = Color(1, 1, 1, 1, vColor.RO, vColor.GO, vColor.BO)
        sprite.Color = Color(1, 1, 1, 1, vColor.RO, vColor.GO, vColor.BO)
      end
    end
  end
end

function mod:hasCollectible()
  return #Isaac.FindByType(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, -1, false, false) > 0
end

function mod:hasPotentialCursedDoor()
  local level = game:GetLevel()
  local room = level:GetCurrentRoom()
  
  if level:GetCurrentRoomIndex() < 0 or room:GetType() ~= RoomType.ROOM_DEFAULT then
    return false
  end
  
  for i = 0, DoorSlot.NUM_DOOR_SLOTS - 1 do
    local door = room:GetDoor(i)
    if door and door.TargetRoomIndex >= 0 and door.TargetRoomType == RoomType.ROOM_DEFAULT then
      return true
    end
  end
  
  return false
end

function mod:shouldReloadBossRoom()
  local level = game:GetLevel()
  local stage = level:GetStage()
  local room = level:GetCurrentRoom()
  
  if level:GetCurrentRoomIndex() >= 0 and room:IsCurrentRoomLastBoss() then
    if game:IsGreedMode() then
      if stage ~= LevelStage.STAGE7_GREED then -- ultra greed
        return true
      end
    else
      if not (stage == LevelStage.STAGE3_2 or (mod:isCurseOfTheLabyrinth() and stage == LevelStage.STAGE3_1)) then -- mom
        return true
      end
    end
  end
  
  return false
end

function mod:getStageApiBaseStage(name)
  local level = game:GetLevel()
  local stage = level:GetStage()
  local stageType = level:GetStageType()
  
  for n, v in pairs(StageAPI.CustomStages) do
    if n ~= name and
       v.XLStage and v.XLStage.Name and v.XLStage.Name == name and
       v.Replaces and v.Replaces.OverrideStage == stage and v.Replaces.OverrideStageType == stageType
    then
      return v
    end
  end
  
  return nil
end

function mod:reloadStage()
  if StageAPI and StageAPI.Loaded and StageAPI.CurrentStage and StageAPI.CurrentStage.Name and not StageAPI.CurrentStage.NormalStage then
    -- if xl stage
    local currentStage = mod:getStageApiBaseStage(StageAPI.CurrentStage.Name) or StageAPI.CurrentStage
    StageAPI.GotoCustomStage(currentStage, false, true)
  else
    local level = game:GetLevel()
    local stage = level:GetStage()
    local stageType = level:GetStageType()
    local stageTypeMap = {
                           [StageType.STAGETYPE_WOTL]         = 'a',
                           [StageType.STAGETYPE_AFTERBIRTH]   = 'b',
                           [StageType.STAGETYPE_REPENTANCE]   = 'c',
                           [StageType.STAGETYPE_REPENTANCE_B] = 'd'
                         }
    
    local letter = stageTypeMap[stageType]
    if letter then
      stage = stage .. letter
    end
    
    Isaac.ExecuteCommand('stage ' .. stage)
  end
end

function mod:reloadRoom()
  local level = game:GetLevel()
  
  level.LeaveDoor = DoorSlot.NO_DOOR_SLOT
  game:ChangeRoom(level:GetCurrentRoomIndex(), -1)
end

function mod:disableAllSeedEffects()
  local level = game:GetLevel()
  local seeds = game:GetSeeds()
  local isBlindBefore = mod:isCurseOfTheBlind()
  local isCursedBefore = mod:isCurseOfTheCursed()
  local isLabyrinthBefore = mod:isCurseOfTheLabyrinth()
  local seedEffectCount = 0
  
  -- seeds:ClearSeedEffects()
  for i = 0, SeedEffect.NUM_SEEDS - 1 do
    if seeds:HasSeedEffect(i) then
      seeds:RemoveSeedEffect(i)
      seedEffectCount = seedEffectCount + 1
      
      if mod.data[i] and mod.data[i].remove then
        mod.data[i].remove()
      end
    end
  end
  
  if seedEffectCount > 0 then
    local isBlindAfter = mod:isCurseOfTheBlind()
    local isCursedAfter = mod:isCurseOfTheCursed()
    local isLabyrinthAfter = mod:isCurseOfTheLabyrinth()
    
    if isLabyrinthBefore ~= isLabyrinthAfter then
      mod:reloadStage()
    elseif level:GetCurrentRoomIndex() >= 0 and (mod.doReloadRoom or (isBlindBefore ~= isBlindAfter and mod:hasCollectible()) or (isCursedBefore ~= isCursedAfter and mod:hasPotentialCursedDoor())) then
      mod:reloadRoom()
    end
    
    mod.doReloadRoom = false
  end
  
  return seedEffectCount
end

function mod:toggleSeedEffect(seedEffect)
  local level = game:GetLevel()
  local seeds = game:GetSeeds()
  local isBlindBefore = mod:isCurseOfTheBlind()
  local isCursedBefore = mod:isCurseOfTheCursed()
  local isLabyrinthBefore = mod:isCurseOfTheLabyrinth()
  
  if seeds:HasSeedEffect(seedEffect) then
    seeds:RemoveSeedEffect(seedEffect)
    
    if mod.data[seedEffect].remove then
      mod.data[seedEffect].remove()
    end
  else
    local seedEffects = {}
    for i = 0, SeedEffect.NUM_SEEDS - 1 do
      if seeds:HasSeedEffect(i) then
        table.insert(seedEffects, i)
      end
    end
    
    seeds:RemoveBlockingSeedEffects(seedEffect)
    
    for i = 0, SeedEffect.NUM_SEEDS - 1 do
      if mod:tableHasValue(seedEffects, i) and not seeds:HasSeedEffect(i) then
        if mod.data[i] and mod.data[i].remove then
          mod.data[i].remove()
        end
      end
    end
    
    seeds:AddSeedEffect(seedEffect)
    
    if mod.data[seedEffect].add then
      mod.data[seedEffect].add()
    end
  end
  
  local isBlindAfter = mod:isCurseOfTheBlind()
  local isCursedAfter = mod:isCurseOfTheCursed()
  local isLabyrinthAfter = mod:isCurseOfTheLabyrinth()
  
  if isLabyrinthBefore ~= isLabyrinthAfter then
    mod:reloadStage()
  elseif level:GetCurrentRoomIndex() >= 0 and (mod.doReloadRoom or (isBlindBefore ~= isBlindAfter and mod:hasCollectible()) or (isCursedBefore ~= isCursedAfter and mod:hasPotentialCursedDoor())) then
    mod:reloadRoom()
  end
  
  mod.doReloadRoom = false
end

function mod:isCurseOfTheBlind()
  local level = game:GetLevel()
  local curses = level:GetCurses()
  local curse = LevelCurse.CURSE_OF_BLIND
  
  return curses & curse == curse
end

function mod:isCurseOfTheCursed()
  local level = game:GetLevel()
  local curses = level:GetCurses()
  local curse = LevelCurse.CURSE_OF_THE_CURSED
  
  return curses & curse == curse
end

function mod:isCurseOfTheLabyrinth()
  local level = game:GetLevel()
  local curses = level:GetCurses()
  local curse = LevelCurse.CURSE_OF_LABYRINTH
  
  return curses & curse == curse
end

function mod:tableHasValue(tbl, val)
  for _, v in ipairs(tbl) do
    if v == val then
      return true
    end
  end
  
  return false
end

-- start ModConfigMenu --
function mod:setupModConfigMenu()
  local titles = { 'General' }
  for _, v in ipairs(mod.order) do
    table.insert(titles, v.title)
  end
  for _, v in ipairs(titles) do
    ModConfigMenu.RemoveSubcategory(mod.Name, v)
  end
  ModConfigMenu.AddSetting(
    mod.Name,
    'General',
    {
      Type = ModConfigMenu.OptionType.BOOLEAN,
      CurrentSetting = function()
        return false
      end,
      Display = function()
        return 'Disable all seed effects'
      end,
      OnChange = function(b)
        mod:disableAllSeedEffects()
      end,
      Info = { 'Disable all easter eggs' }
    }
  )
  ModConfigMenu.AddSetting(
    mod.Name,
    'General',
    {
      Type = ModConfigMenu.OptionType.BOOLEAN,
      CurrentSetting = function()
        return false
      end,
      Display = function()
        return 'Unlock all seed effects'
      end,
      OnChange = function(b)
        Isaac.ExecuteCommand('eggs')
      end,
      Info = { 'This runs the "eggs" command which unlocks all easter eggs without having to unlock them individually' }
    }
  )
  ModConfigMenu.AddSpace(mod.Name, 'General')
  ModConfigMenu.AddText(mod.Name, 'General', function()
    local seeds = game:GetSeeds()
    return 'Seed effects enabled: ' .. seeds:CountSeedEffects() .. ' / ' .. mod.numSeedEffects
  end)
  ModConfigMenu.AddText(mod.Name, 'General', function()
    return 'Seed effects unlocked: ' .. Seeds.CountUnlockedSeedEffects() .. ' / ' .. mod.numSeedEffects
  end)
  for _, v in ipairs(mod.order) do
    for _, w in ipairs(v.list) do
      if w == -1 then
        ModConfigMenu.AddSpace(mod.Name, v.title)
      else
        ModConfigMenu.AddSetting(
          mod.Name,
          v.title,
          {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
              return false
            end,
            Display = function()
              local seeds = game:GetSeeds()
              return mod.data[w].name .. ' : ' .. (seeds:HasSeedEffect(w) and 'on' or 'off')
            end,
            OnChange = function(b)
              mod:toggleSeedEffect(w)
            end,
            Info = mod.data[w].info
          }
        )
      end
    end
  end
end
-- end ModConfigMenu --

mod.numSeedEffects = mod:countSeedEffects()
mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, mod.onGameStart)
mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, mod.onGameExit)
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, mod.onPlayerInit, 0) -- 0 is player, 1 is co-op baby
mod:AddCallback(ModCallbacks.MC_EXECUTE_CMD, mod.onExecuteCmd)

if ModConfigMenu then
  mod:setupModConfigMenu()
end

if REPENTOGON then
  function mod:registerCommands()
    Console.RegisterCommand('seed-effects-disable-all', 'Disable all seed effects (easter eggs)', 'Disable all seed effects (easter eggs)', false, AutocompleteType.NONE)
  end
  
  function mod:onModsLoaded()
    mod:setupImGui()
  end
  
  function mod:localize(category, key)
    local s = Isaac.GetString(category, key)
    return (s == nil or s == 'StringTable::InvalidCategory' or s == 'StringTable::InvalidKey') and key or s
  end
  
  function mod:setupImGuiMenu()
    if not ImGui.ElementExists('shenanigansMenu') then
      ImGui.CreateMenu('shenanigansMenu', '\u{f6d1} Shenanigans')
    end
  end
  
  function mod:setupImGui()
    ImGui.AddElement('shenanigansMenu', 'shenanigansMenuItemSeedEffects', ImGuiElement.MenuItem, '\u{f4d8} Seed Effect Shenanigans')
    ImGui.CreateWindow('shenanigansWindowSeedEffects', 'Seed Effect Shenanigans')
    ImGui.LinkWindowToElement('shenanigansWindowSeedEffects', 'shenanigansMenuItemSeedEffects')
    
    ImGui.AddButton('shenanigansWindowSeedEffects', 'shenanigansBtnSeedEffects', mod:localize('SeedMenu', '#SEED_RESET'), function()
      if mod:isInGame() then
        mod:disableAllSeedEffects()
      end
    end, false)
    ImGui.AddElement('shenanigansWindowSeedEffects', '', ImGuiElement.SameLine, '')
    local txtId = 'shenanigansTxtSeedEffects'
    ImGui.AddText('shenanigansWindowSeedEffects', '', false, txtId)
    ImGui.AddCallback(txtId, ImGuiCallback.Render, function()
      local seeds = game:GetSeeds()
      ImGui.UpdateData(txtId, ImGuiData.Label, seeds:CountSeedEffects() .. ' / ' .. mod.numSeedEffects)
    end)
    
    -- repentogon doesn't let you dynamically grab seedmenu.xml
    for _, v in ipairs(mod.order) do
      for j, w in ipairs(v.list) do
        if w == -1 then
          ImGui.AddElement('shenanigansWindowSeedEffects', '', ImGuiElement.Separator, '')
        else
          if j == 1 then
            ImGui.AddElement('shenanigansWindowSeedEffects', '', ImGuiElement.Separator, '')
          end
          
          local chkId = 'shenanigansChkSeedEffect' .. w
          local chkName = mod:localize('SeedMenu', '#SEED_' .. w)
          if not mod.data[w].achievements then
            chkName = chkName .. ' \u{f05e}'
          end
          ImGui.AddCheckbox('shenanigansWindowSeedEffects', chkId, chkName, nil, false)
          if mod.data[w].helpMarkerIdx then
            ImGui.SetHelpmarker(chkId, mod.data[w].info[mod.data[w].helpMarkerIdx])
          end
          ImGui.AddCallback(chkId, ImGuiCallback.Render, function()
            local seeds = game:GetSeeds()
            ImGui.UpdateData(chkId, ImGuiData.Value, seeds:HasSeedEffect(w))
          end)
          ImGui.AddCallback(chkId, ImGuiCallback.Edited, function(b)
            if mod:isInGame() then
              mod:toggleSeedEffect(w)
            end
          end)
        end
      end
    end
  end
  
  mod:registerCommands()
  mod:setupImGuiMenu()
  mod:AddCallback(ModCallbacks.MC_POST_MODS_LOADED, mod.onModsLoaded)
end