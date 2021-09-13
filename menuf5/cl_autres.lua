ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	end
  end)

  ragdol = true

  RegisterNetEvent("Ragdoll") 
  AddEventHandler("Ragdoll", function()
      if ( ragdol ) then
          setRagdoll(true)
          ragdol = false
          ESX.ShowColoredNotification("Vous etes par terre !", 6)
      else
  
          setRagdoll(false)
          ragdol = true
          ESX.ShowColoredNotification("Vous etes debout !", 18)
      end
  end)

  
  function startScenario(anim)
      TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
  end
  
  function startAttitude(lib, anim)
      ESX.Streaming.RequestAnimSet(lib, function()
          SetPedMovementClipset(PlayerPedId(), anim, true)
      end)
  end
  
  function startAnim(lib, anim)
      ESX.Streaming.RequestAnimDict(lib, function()
          TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
      end)
  end


local papiers = {
    "Montrer",
    "Regarder"
}

local accesoire = {
    "Lunnetes",
    "Chapeau"
}
-----

-----
AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)


 
local f5 = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 17, 51}, Title = GetPlayerName() },
	Data = { currentMenu = "Menu interactions", GetPlayerName() }, 
    Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)

            function openCinematique()
                hasCinematic = not hasCinematic
                if not hasCinematic then -- show
                    SendNUIMessage({openCinema = false})
                    ESX.UI.HUD.SetDisplay(1.0)
                    TriggerEvent('es:setMoneyDisplay', 1.0)
                    TriggerEvent('esx_status:setDisplay', 1.0)
                    DisplayRadar(true)
                    TriggerEvent('ui:toggle', true)
                elseif hasCinematic then -- hide
                    SendNUIMessage({openCinema = true})
                    ESX.UI.HUD.SetDisplay(0.0)
                    TriggerEvent('es:setMoneyDisplay', 0.0)
                    TriggerEvent('esx_status:setDisplay', 0.0)
                    DisplayRadar(false)
                    TriggerEvent('ui:toggle', false)
                end
            end


			
		if btn == "Vetements" then                                      
            ----------------------------filtres-------------------------------
        elseif btn == "filtres" then --Ouvre le menu des filtres
            OpenMenu("Filtres")
        elseif btn == "Violet & Bleu" then -- Filtre
            SetTimecycleModifier('PPPurple01')
        elseif btn == "Couleur Amplifiée" then	 -- Filtre
            SetTimecycleModifier('BombCamFlash')
        elseif btn == "Vue normal" then	-- Filtre
            SetTimecycleModifier('default')
        end
        
            if btn == "Contrastes" then 
                OpenMenu("Contraste")
            elseif btn == "Eclaircissement" then 
                SetTimecycleModifier('canyon_mission')
            elseif btn == "Contraste" then 
                SetTimecycleModifier('player_transition_no_scanlines')
            elseif btn == "Fin du Monde" then 
                OpenMenu("Fin du Monde")
            elseif btn == "Fin du Monde 1" then 
                SetTimecycleModifier('New_sewers')
            elseif btn == "Gris Fin du Monde" then 
                SetTimecycleModifier('NG_filmic20')
            elseif btn == "Grésillement" then 
                OpenMenu("Grésillement")
            elseif btn == "Grésillement 1" then 
                SetTimecycleModifier('BeastIntro01')
            elseif btn == "Grésillement 2" then 
                SetTimecycleModifier('spectator2')
            elseif btn == "Brouillard" then 
                OpenMenu("Brouillard")
            elseif btn == "Brouillard 1" then 
                SetTimecycleModifier('v_abattoir')
            elseif btn == "Brouillard Eclairci" then 
                SetTimecycleModifier('v_bahama')
            elseif btn == "Gros Brouillard" then 
                SetTimecycleModifier('v_cashdepot')

            elseif btn == "Vue / Couleur Amplifié" then 
                OpenMenu("Vue / Couleur Amplifié")
            elseif btn == "Vue & lumières améliorées" then 
                SetTimecycleModifier('Tunnel')
            elseif btn == "Couleurs amplifiées" then 
                SetTimecycleModifier('rply_saturation')
            elseif btn == "Couleurs amplifiées 2" then 
                SetTimecycleModifier('BombCamFlash')
            elseif btn == "Couleurs" then 
                OpenMenu("Couleurs")
            elseif btn == "Noir & Blanc" then 
                SetTimecycleModifier('rply_saturation_neg')
            elseif btn == "Violet et Bleu" then 
                SetTimecycleModifier('PPPurple01')
            elseif btn == "Rouge" then 
                SetTimecycleModifier('li')
            elseif btn == "Sous l'Eau" then 
                SetTimecycleModifier('SALTONSEA')
            ------------------------------fin des filtres-----------------------------------
        elseif btn == "Mes Clefs						 			→" then
            TriggerEvent("esx_menu:key")
            CloseMenu(force)
            ESX.ShowNotification("~g~menu cles en beta vous avez la posibilité de faire un /givekey depuis le chat")

            ------------------------Carte d'identité------------
        elseif slide == 1 and btn == "Carte d'identité" then
        if closestDistance ~= -1 and closestDistance <= 3 then
           TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), 
            GetPlayerServerId(closestPlayer))
            else ESX.ShowColoredNotification(('~r~Personne a proximité !'))
            end
       elseif slide == 2 and btn == "Carte d'identité" then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), 
        GetPlayerServerId(PlayerId()))

         ------------------------Permis de conduire------------
        elseif slide == 1 and btn == "Permis de conduire" then
            if closestDistance ~= -1 and closestDistance <= 3 then
            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
        else
            ESX.ShowNotification(('~r~Personne a proximité !'))
        end

    elseif slide == 2 and btn == "Permis de conduire" then
        
            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
    
            

---------------------------------permis darme------------------
elseif slide == 1 and btn == "Permis de port d'armes" then
    if closestDistance ~= -1 and closestDistance <= 3 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
else
    ESX.ShowNotification(('~r~Personne a proximité !'))
end


elseif slide == 2 and btn == "Permis de port d'armes" then
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')

-----------------------------  Début FESTIVES ----------------------------------------------------------
			
elseif btn == "Fumer une cigarette" then                                      
				
    startScenario('WORLD_HUMAN_SMOKING')

elseif btn == "Fumer un joint" then                                      
    
    startScenario('WORLD_HUMAN_SMOKING_POT')

elseif btn == "Dj" then                                      
    
    startAnim('anim@mp_player_intcelebrationmale@dj', 'dj')

elseif btn == "Bourré sur place" then                                      
    
    startAnim('amb@world_human_bum_standing@drunk@idle_a', 'idle_a')

elseif btn == "Vomir en voiture" then                                      
    
    startAnim('oddjobs@taxi@tie', 'vomit_outside')

-----------------------------  FIN FESTIVES ----------------------------------------------------------

-----------------------------  Début Divers ----------------------------------------------------------

elseif btn == "Boire un café" then                                      
    
    startAnim('amb@world_human_aa_coffee@idle_a', 'idle_a')

elseif btn == "S'asseoir" then                                      
    
    startAnim('anim@heists@prison_heistunfinished_biztarget_idle', 'target_idle')

elseif btn == "Attendre contre un mur" then                                      
    
    startScenario('world_human_leaning')

elseif btn == "Couché sur le dos" then                                      
    
    startScenario('WORLD_HUMAN_SUNBATHE_BACK')

elseif btn == "Couché sur le ventre" then                                      
    
    startScenario('WORLD_HUMAN_SUNBATHE')

elseif btn == "Nettoyer quelque chose" then                                      
    
    startScenario('world_human_maid_clean')

elseif btn == "Préparer à manger" then                                      
    
    startScenario('PROP_HUMAN_BBQ')

elseif btn == "Position de Fouille" then                                      
    
    startAnim('mini@prostitutes@sexlow_veh', 'low_car_bj_to_prop_female')

elseif btn == "Prendre un selfie" then                                      
    
    startScenario('world_human_tourist_mobile')

elseif btn == "Ecouter à une porte" then                                      
    
    startAnim('mini@safe_cracking', 'idle_base')

-----------------------------  FIN Divres ----------------------------------------------------------

-----------------------------  Début Sport ----------------------------------------------------------

elseif btn == "Montrer ses muscles" then                                      
    
    startAnim('amb@world_human_muscle_flex@arms_at_side@base', 'base')

elseif btn == "Faire des pompes" then                                      
    
    startAnim('amb@world_human_push_ups@male@base', 'base')

elseif btn == "Faire des abdos" then                                      
    
    startAnim('amb@world_human_sit_ups@male@base', 'base')

elseif btn == "Faire du yoga" then                                      
    
    startAnim('amb@world_human_yoga@male@base', 'base_a')

-----------------------------  FIN Sport ----------------------------------------------------------

-----------------------------  Début salutation ----------------------------------------------------------

elseif btn == "Saluer" then                                      
    
    startAnim('gestures@m@standing@casual', 'gesture_hello')

elseif btn == "Serrer la main" then                                      
    
    startAnim('mp_common', 'givetake1_a')

elseif btn == "Tchek" then                                      
    
    startAnim('mp_ped_interaction', 'handshake_guy_a')

elseif btn == "Salut bandit" then                                      
    
    startAnim('mp_ped_interaction', 'hugs_guy_a')

elseif btn == "Salut Militaire" then                                      
    
    startAnim('mp_player_int_uppersalute', 'mp_player_int_salute')



----------------------------------------FIN salutation------------------------------------------------------
---------------------------------------poses-------------------------------------------------------------
elseif btn == "Se rendre" then
    --startAnims("random@arrests@busted", "idle_c")
    ExecuteCommand('e surrender')
elseif btn == "Pêcheur" then
    startScenarios("world_human_stand_fishing", 9)
elseif btn == "Police : Enquêter" then
    startAnims("amb@code_human_police_investigate@idle_b", "idle_f")
elseif btn == "Police : Parler à la radio" then
    startAnim("random@arrests", "generic_radio_chatter")
elseif btn == "Police : Circulation" then
    startScenarios("WORLD_HUMAN_CAR_PARK_ATTENDANT", 9)
elseif btn == "Police : Jumelles" then
    startScenarios("WORLD_HUMAN_BINOCULARS", 9)
elseif btn == "Agriculture : Récolter" then
    startScenarios("world_human_gardener_plant", 9)
elseif btn == "Dépanneur : Réparer le moteur" then
    startAnim("mini@repair", "fixing_a_ped")
elseif btn == "Médecin : Observer" then
    startScenarios("CODE_HUMAN_MEDIC_KNEEL", 9)
elseif btn == "Taxi : Parler au client" then
    startAnim("oddjobs@taxi@driver", "leanover_idle")
elseif btn == "Taxi : Donner la facture" then
    startAnim("oddjobs@taxi@cyi", "std_hand_off_ps_passenger")
elseif btn == "Epicier : Donner les courses" then
    startAnim("mp_am_hold_up", "purchase_beerbox_shopkeeper")
elseif btn == "Barman : Servir un shot" then
    startAnim("mini@drinking", "shots_barman_b")
elseif btn == "Journaliste : Prendre une photo" then
    startScenarios("WORLD_HUMAN_PAPARAZZI", 9)
elseif btn == "Tout : Prendre des notes" then
    startScenarios("WORLD_HUMAN_CLIPBOARD", 9)
elseif btn == "Tout : Coup de marteau" then
    startScenarios("WORLD_HUMAN_HAMMERING", 9)
elseif btn == "SDF : Faire la manche" then
    startScenarios("WORLD_HUMAN_BUM_FREEWAY", 9)
end

if btn == "Souffrance" then 
    startAnims("anim@heists@prison_heistig_5_P1_rashkovsky_idle", "idle_180")
elseif btn == "Sports" then 
    OpenMenu("Sports")
elseif btn == "Montrer ses muscles" then 
    startAnim("amb@world_human_muscle_flex@arms_at_side@base", "base")
elseif btn == "Barre de musculation" then 
    startAnim("amb@world_human_muscle_free_weights@male@barbell@base", "base")
elseif btn == "Faire des pompes" then 
    startAnims("amb@world_human_push_ups@male@base", "base")
elseif btn == "Faire des abdos" then 
    startAnims("amb@world_human_sit_ups@male@base", "base")
elseif btn == "Faire du yoga" then 
    startAnims("amb@world_human_yoga@male@base", "base_a")
--------------------------------------------------------------------------------------------------------
                  
-------------------------------------------------------------------------------------------------------------
elseif btn == "Glisser" then
    --startAnims("anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a")
    ExecuteCommand('e slide')
elseif btn == "Reverence" then
    --startAnim("anim@arena@celeb@podium@no_prop@", "regal_c_1st")
    ExecuteCommand('e bow')
elseif btn == "Pleurer sur les genoux" then
    startAnims("mp_bank_heist_1", "f_cower_01")
elseif btn == "Jeter votre carnet" then
    startScenario("CODE_HUMAN_MEDIC_TIME_OF_DEATH")
elseif btn == "Notes" then
    startScenario("WORLD_HUMAN_CLIPBOARD")
elseif btn == "Siffler" then
    startAnim("rcmnigel1c", "hailing_whistle_waive_a")
elseif btn == "Locoooo" then
    startAnims("anim@mp_player_intcelebrationmale@you_loco", "you_loco")
elseif btn == "Branlette" then
    startAnims("anim@mp_player_intcelebrationmale@wank", "wank")
elseif btn == "Laché moi" then
    startAnims("anim@mp_player_intcelebrationmale@freakout", "freakout")
elseif btn == "Mendier" then
    startScenario("WORLD_HUMAN_BUM_FREEWAY")
elseif btn == "Applaudir" then
    startScenario("WORLD_HUMAN_CHEERING")
elseif btn == "Auplaudir lentement" then
    startAnim("anim@mp_player_intcelebrationmale@slow_clap", "slow_clap")
elseif btn == "Appel" then 
    startAnim("cellphone@", "cellphone_call_listen_base")
elseif btn == "Encouragement" then 
    startAnims("mini@triathlon", "male_one_handed_a")
elseif btn == "Prendre une photo" then 
    startScenario("WORLD_HUMAN_MOBILE_FILM_SHOCKING")
elseif btn == "Same" then 
    startAnim("special_ped@mime@monologue_5@monologue_5a", "10_ig_1_wa_0")
elseif btn == "Jeter votre carte" then 
    startScenario("WORLD_HUMAN_TOURIST_MAP")
--[[elseif btn == "Acrobatie 1" then 
    startAnims("anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a")
    ExecuteCommand('e flip2')
elseif btn == "Acrobatie 2" then 
    startAnims("anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a")
    ExecuteCommand('e flip')
elseif btn == "Acrobatie 3" then 
    startAnims("anim@arena@celeb@flat@solo@no_props@", "pageant_a_player_a")--]]

-----------------------------  Début démarches ----------------------------------------------------------

elseif btn == "Normal M" then                                      
    
    startAttitude('move_m@confident', 'move_m@confident')

elseif btn == "Normal F" then                                      
    
    startAttitude('move_f@heels@c', 'move_f@heels@c')

elseif btn == "Depressif M" then                                      
    
    startAttitude('move_m@depressed@a', 'move_m@depressed@a')

elseif btn == "Depressif F" then                                      
    
    startAttitude('move_f@depressed@a', 'move_f@depressed@a')

elseif btn == "Business" then                                      
    
    startAttitude('move_m@business@a', 'move_m@business@a')

elseif btn == "Determine" then                                      
    
    startAttitude('move_m@brave@a', 'move_m@brave@a')

elseif btn == "Casual" then                                      
    
    startAttitude('move_m@casual@a', 'move_m@casual@a')

elseif btn == "Trop mangé" then                                      
    
    startAttitude('move_m@fat@a', 'move_m@fat@a')

elseif btn == "Hipster" then                                      
    
    startAttitude('move_m@hipster@a', 'move_m@hipster@a')

elseif btn == "Blesse" then                                      
    
    startAttitude('move_m@injured', 'move_m@injured')

elseif btn == "Intimide" then                                      
    
    startAttitude('move_m@hurry@a', 'move_m@hurry@a')

elseif btn == "Hobo" then                                      
    
    startAttitude('move_m@hobo@a', 'move_m@hobo@a')

elseif btn == "Malheureux" then                                      
    
    startAttitude('move_m@sad@a', 'move_m@sad@a')

elseif btn == "Muscle" then                                      
    
    startAttitude('move_m@muscle@a', 'move_m@muscle@a')

elseif btn == "Choc" then                                      
    
    startAttitude('move_m@shocked@a', 'move_m@shocked@a')

elseif btn == "Sombre" then                                      
    
    startAttitude('move_m@shadyped@a', 'move_m@shadyped@a')

elseif btn == "Fatigue" then                                      
    
    startAttitude('move_m@buzzed', 'move_m@buzzed')

elseif btn == "Pressee" then                                      
    
    startAttitude('move_m@hurry_butch@a', 'move_m@hurry_butch@a')

elseif btn == "Fier" then                                      
    
    startAttitude('move_m@money', 'move_m@money')

elseif btn == "Petite course" then                                      
    
    startAttitude('move_m@quick', 'move_m@quick')

elseif btn == "Mangeuse d'homme" then                                      
    
    startAttitude('move_f@maneater', 'move_f@maneater')

elseif btn == "Impertinent" then                                      
    
    startAttitude('move_f@sassy', 'move_f@sassy')

elseif btn == "Arrogante" then                                      
    



startAttitude('move_f@arrogant@a', 'move_f@arrogant@a')

elseif btn == "~r~Stopper l'animation" then                                      
    
    ClearPedTasksImmediately(PlayerPedId())

    ESX.ShowNotification("Animation ~r~stopper~s~ !")
elseif btn == "Tombé / Se réveiller" then                                      
    
    TriggerEvent("Ragdoll", source)


------------------------------





end
end

},

	Menu = { 
		["Menu interactions"] = { 
			b = { 
                 
                
                {name = "~b~Papiers", ask = ">", askX = true},
                {name = "Mes Clefs						 			→"},
                {name = "~o~Animations", ask = ">", askX = true},
                {name = "----------------------------------------------------------------------", ask = "", askX = true},
                {name = "~g~Actions", ask = ">", askX = true},
                
			}
        },

        ["~g~actions"] = { 
			b = { 
                 
                
                {name = "~y~Réglages", ask = ">", askX = true}, 
                
			}
        },

        ["~y~réglages"] = { 
			b = { 
                 
                
                {name = "Filtres", ask = ">", askX = true}, 
                --{name = "~r~Soon", ask = ">", askX = true},
			}
        },


----------------------------------filtres----------------------------
        ["filtres"] = { 
			b = { 
				{name = "Vue normal"},
				{name = "Contrastes",ask = "→", askX = true},
				{name = "Fin du Monde",ask = "→", askX = true},
				{name = "Grésillement",ask = "→", askX = true},
				{name = "Brouillard",ask = "→", askX = true},
				{name = "Vue / Couleur Amplifié",ask = "→", askX = true},
				{name = "Couleurs",ask = "→", askX = true}
			}
		},

        ["contrastes"] = {
			b = { 
				{name = "Contraste"},
				{name = "Eclaircissement"}
			}
		},

        ["Couleurs"] = {
			b = { 
				{name = "Noir & Blanc"},
				{name = "Violet et Bleu"},
				{name = "Rouge"},
				{name = "Sous l'Eau"}
			}
		},

        ["Vue / Couleur Amplifié"] = {
			b = { 
				{name = "Vue & lumières améliorées"},
				{name = "Couleurs amplifiées"},
				{name = "Couleurs amplifiées 2"}
			}
		},

        ["Fin du Monde"] = {
			b = { 
				{name = "Fin du Monde 1"},
				{name = "Gris Fin du Monde"}
			}
		},

        ["grésillement"] = {
			b = { 
				{name = "Grésillement 1"},
				{name = "Grésillement 2"}
			}
		},

        ["Brouillard"] = {
			b = { 
				{name = "Brouillard 1"},
				{name = "Brouillard Eclairci"},
				{name = "Gros Brouillard"}
			}
		},

     ---------------------------------------fin------------------------------------
       

        ["~b~papiers"] = { 
			b = { 
                {name = "Carte d'identité", slidemax = papiers}, 
                {name = "Permis de conduire", slidemax = papiers}, 
                {name = "Permis de port d'armes", slidemax = papiers}, 
			}
        },


    
        ["~o~animations"] = {
			b = {
				{name = "~r~Stopper l'animation"},
				{name = "Tombé / Se réveiller"},
				{name = "Festives", ask = ">", askX = true},
				{name = "Divers", ask = ">", askX = true},
				{name = "Sport", ask = ">", askX = true},
				{name = "Salutation", ask = ">", askX = true},
                {name = "Actions anim", ask = ">", askX = true},
                {name = "Poses", ask = ">", askX = true},
                {name = "~g~Démarches"},
			}
		},

        ["actions anim"] = {
			
			b = { 
				--{name = "Acrobatie 1"},
				--{name = "Acrobatie 2"},
				--{name = "Acrobatie 3"},
				{name = "Applaudir"},
				{name = "Auplaudir lentement"},
				{name = "Appel"},
				--{name = "Être Sonné"},
				--{name = "Encouragement"},
				--{name = "Glisser"},
				{name = "Jeter votre carnet"},
				{name = "Jeter votre carte"},
				--{name = "Locoooo"},
				--{name = "Laché moi"},
				{name = "Notes"},
				{name = "Mendier"},
				--{name = "Pleurer sur les genoux"},
				--{name = "Prendre une photo"},
				--{name = "Reverence"},
				--{name = "Se sentir Mal"},
				{name = "Siffler"},
				{name = "Same"}
			}
		},
        ["poses"] = {
			
			b = { 
				--{name = "Agriculture : Récolter"},
				{name = "Barman : Servir un shot"},
				{name = "Dépanneur : Réparer le moteur"},
				{name = "Epicier : Donner les courses"},
				--{name = "Journaliste : Prendre une photo"},
				--{name = "Médecin : Observer"},
				--{name = "Pêcheur"},
				--{name = "Police : Enquêter"},
				{name = "Police : Parler à la radio"},
				--{name = "Police : Circulation"},
				--{name = "Police : Jumelles"},
				--{name = "SDF : Faire la manche"},
				--{name = "Se rendre"},
				--{name = "Se Rendre Debout"},
				{name = "Taxi : Parler au client"},
				{name = "Taxi : Donner la facture"},
				--{name = "Tout : Prendre des notes"},
				--{name = "Tout : Coup de marteau"}
			}
		},

["festives"] = {
			b = {
				{name = "Fumer une cigarette"},
				{name = "Fumer un joint"},
				{name = "Dj"},
				{name = "Bourré sur place"},
				{name = "Vomir en voiture"},
			}
		},

		["divers"] = {
			b = {
				{name = "Boire un café"},
				{name = "S'asseoir"},
				{name = "Attendre contre un mur"},
				{name = "Couché sur le dos"},
				{name = "Couché sur le ventre"},
				{name = "Nettoyer quelque chose"},
				{name = "Préparer à manger"},
				{name = "Position de Fouille"},
				{name = "Prendre un selfie"},
				{name = "Ecouter à une porte"},
			}
		},

		["sport"] = {
			b = {
				{name = "Montrer ses muscles"},
				{name = "Faire des pompes"},
				{name = "Faire des abdos"},
				{name = "Faire du yoga"},
			}
		},

		["salutation"] = {
			b = {
				{name = "Saluer"},
				{name = "Serrer la main"},
				{name = "Tchek"},
				{name = "Salut bandit"},
				{name = "Salut Militaire"},
			}
		},

       
		["~g~démarches"] = {
			b = {
				{name = "Normal M"},
				{name = "Normal F"},
				{name = "Depressif M"},
				{name = "Depressif F"},
				{name = "Business"},
				{name = "Determine"},
				{name = "Casual"},
				{name = "Trop mangé"},
				{name = "Hipster"},
				{name = "Blesse"},
				{name = "Intimide"},
				{name = "Hobo"},
				{name = "Malheureux"},
				{name = "Muscle"},
				{name = "Choc"},
				{name = "Sombre"},
				{name = "Fatigue"},
				{name = "Pressee"},
				{name = "Fier"},
				{name = "Petite course"},
				{name = "Mangeuse d'homme"},
				{name = "Impertinent"},
				{name = "Arrogante"},
			}
		}	
	}
}
		






Citizen.CreateThread(function()
    while true do
        Wait(1)
        if IsControlJustReleased(0, 166) then
            CreateMenu(f5)
        end  
    end
end)

local ragdoll = false
function setRagdoll(flag)
  ragdoll = flag
end
Citizen.CreateThread(function()
  while true do
	Citizen.Wait(0)
	if ragdoll then
	  SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
	end
  end
end)
----haut
RegisterNetEvent('RiZiePersoMenu:haut')

AddEventHandler('RiZiePersoMenu:haut', function()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)

        TriggerEvent('skinchanger:getSkin', function(skinb)

            local lib, anim = 'clothingtie', 'try_tie_neutral_a'

            ESX.Streaming.RequestAnimDict(lib, function()

                TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

            end)

            Citizen.Wait(1000)

            ClearPedTasks(PlayerPedId())



            if skina.torso_1 ~= skinb.torso_1 then

                vethaut = true

                TriggerEvent('skinchanger:loadClothes', skinb, {['torso_1'] = skina.torso_1, ['torso_2'] = skina.torso_2, ['tshirt_1'] = skina.tshirt_1, ['tshirt_2'] = skina.tshirt_2, ['arms'] = skina.arms})

            else

                TriggerEvent('skinchanger:loadClothes', skinb, {['torso_1'] = 15, ['torso_2'] = 0, ['tshirt_1'] = 15, ['tshirt_2'] = 0, ['arms'] = 15})

                vethaut = false

            end



        end)

    end)

end)
----bas
RegisterNetEvent('RiZiePersoMenu:bas')

AddEventHandler('RiZiePersoMenu:bas', function()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)

        TriggerEvent('skinchanger:getSkin', function(skinb)

            local lib, anim = 'clothingtrousers', 'try_trousers_neutral_c'

            ESX.Streaming.RequestAnimDict(lib, function()

                TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

            end)

            Citizen.Wait(1000)

            ClearPedTasks(PlayerPedId())



            if skina.pants_1 ~= skinb.pants_1 then

                TriggerEvent('skinchanger:loadClothes', skinb, {['pants_1'] = skina.pants_1, ['pants_2'] = skina.pants_2})

                vetbas = true

            else

                vetbas = false

                if skina.sex == 1 then

                    TriggerEvent('skinchanger:loadClothes', skinb, {['pants_1'] = 15, ['pants_2'] = 0})

                else

                    TriggerEvent('skinchanger:loadClothes', skinb, {['pants_1'] = 61, ['pants_2'] = 1})

                end

            end





        end)

    end)

end)
---chaussure
RegisterNetEvent('RiZiePersoMenu:chaussures')

AddEventHandler('RiZiePersoMenu:chaussures', function()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)

        TriggerEvent('skinchanger:getSkin', function(skinb)

            local lib, anim = 'clothingshoes', 'try_shoes_positive_a'

            ESX.Streaming.RequestAnimDict(lib, function()

                TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

            end)

            Citizen.Wait(1000)

            ClearPedTasks(PlayerPedId())



            if skina.shoes_1 ~= skinb.shoes_1 then

                TriggerEvent('skinchanger:loadClothes', skinb, {['shoes_1'] = skina.shoes_1, ['shoes_2'] = skina.shoes_2})

                vetch = true

            else

                vetch = false

                if skina.sex == 1 then

                    TriggerEvent('skinchanger:loadClothes', skinb, {['shoes_1'] = 35, ['shoes_2'] = 0})

                else

                    TriggerEvent('skinchanger:loadClothes', skinb, {['shoes_1'] = 34, ['shoes_2'] = 0})

                end

            end





        end)

    end)

end)
---sac
RegisterNetEvent('RiZiePersoMenu:sac')

AddEventHandler('RiZiePersoMenu:sac', function()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)

        TriggerEvent('skinchanger:getSkin', function(skinb)

            local lib, anim = 'clothingtie', 'try_tie_neutral_a'

            ESX.Streaming.RequestAnimDict(lib, function()

                TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

            end)

            Citizen.Wait(1000)

            ClearPedTasks(PlayerPedId())



            if skina.bags_1 ~= skinb.bags_1 then

                TriggerEvent('skinchanger:loadClothes', skinb, {['bags_1'] = skina.bags_1, ['bags_2'] = skina.bags_2})

                vetsac = true

            else

                TriggerEvent('skinchanger:loadClothes', skinb, {['bags_1'] = 0, ['bags_2'] = 0})

                vetsac = false

            end

        end)

    end)

end)
-----Gilet
RegisterNetEvent('RiZiePersoMenu:gilet')

AddEventHandler('RiZiePersoMenu:gilet', function()

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skina)

        TriggerEvent('skinchanger:getSkin', function(skinb)

            local lib, anim = 'clothingtie', 'try_tie_neutral_a'

            ESX.Streaming.RequestAnimDict(lib, function()

                TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

            end)

            Citizen.Wait(1000)

            ClearPedTasks(PlayerPedId())



            if skina.bproof_1 ~= skinb.bproof_1 then

                TriggerEvent('skinchanger:loadClothes', skinb, {['bproof_1'] = skina.bproof_1, ['bproof_2'] = skina.bproof_2})

                vetgilet = true

            else

                TriggerEvent('skinchanger:loadClothes', skinb, {['bproof_1'] = 0, ['bproof_2'] = 0})

                vetgilet = false

            end

        end)

    end)

end)
---accessoire
RegisterNetEvent('RiZiePersoMenu:access')

AddEventHandler('RiZiePersoMenu:access', function(accesstype)

    ESX.TriggerServerCallback('esx_accessories:get', function(eskilaunAccessoires, accessorySkin)

        _accessoire = string.lower(accesstype)

        if eskilaunAccessoires then  

            TriggerEvent('skinchanger:getSkin', function(skin)

                local accessoire = -1

                local couleur = 0



                if _accessoire == "glasses" then

                    accessoire = 0

                    local lib, anim = 'clothingspecs', 'try_glasses_positive_a'

                    ESX.Streaming.RequestAnimDict(lib, function()

                        TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, 1000, 0, 0, false, false, false)

                    end)

                    Citizen.Wait(1000)

                    ClearPedTasks(PlayerPedId())

                elseif _accessoire == "mask" then

                    accessoire = 0

                    local lib, anim = 'missfbi4', 'takeoff_mask'

                    ESX.Streaming.RequestAnimDict(lib, function()

                        TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, 1000, 0, 0, false, false, false)

                    end)

                    Citizen.Wait(850)

					ClearPedTasks(PlayerPedId())
					

                elseif _accessoire == "helmet" then

                    local lib, anim = 'missfbi4', 'takeoff_mask'

                    ESX.Streaming.RequestAnimDict(lib, function()

                        TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, 1000, 0, 0, false, false, false)

                    end)

                    Citizen.Wait(850)

                    ClearPedTasks(PlayerPedId())

                end

                



                if skin[_accessoire .. '_1'] == accessoire then

                    accessoire = accessorySkin[_accessoire .. '_1']

                    couleur = accessorySkin[_accessoire .. '_2']

                    if _accessoire == "glasses" then

                        vetlunettes = true

                    elseif _accessoire == "mask" then

                        vetmasque = true

                    elseif _accessoire == "helmet" then

                        vetchapeau = true

                    end

                else

                    if _accessoire == "glasses" then

                        vetlunettes = false

                    elseif _accessoire == "mask" then

                        vetmasque = false

                    elseif _accessoire == "helmet" then

                        vetchapeau = false

                    end

                end



                local accessorySkin = {}

                accessorySkin[_accessoire .. '_1'] = accessoire

                accessorySkin[_accessoire .. '_2'] = couleur

                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)

            end)

        else

            if _accessoire == "glasses" then

                ESX.ShowNotification(_U('clothes_you_do_not_have_glasses'))

            elseif _accessoire == "mask" then

                ESX.ShowNotification(_U('clothes_you_do_not_have_mask'))

            elseif _accessoire == "helmet" then

                ESX.ShowNotification(_U('clothes_you_do_not_have_helmet'))

            end

        end

    end, accesstype)

end)

print('LSLIFECREATION')
print('discord.gg/8937uMaXtQ')
print('LSLIFECREATION')
print('discord.gg/8937uMaXtQ')
print('LSLIFECREATION')
print('discord.gg/8937uMaXtQ')


