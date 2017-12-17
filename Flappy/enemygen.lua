function loadGeneration()
 
  threshold = 5
  thresholdPassed = 0
  spawnIntervalDefault = 120
  spawnInterval = spawnIntervalDefault
  spawnTimer = 0
  currentDiff = 1
  enemiesKilled = 0
  totalEnemiesKilled = 0
  incrementNumber = 1
  
  timerThreshold = 10000
  
  currentType = 1
  
  end

function enemyGenerationCheck(dt, enemiesDefeated)
  if (totalEnemiesKilled ~= enemiesDefeated) then
  enemiesKilled = enemiesKilled + (enemiesDefeated - totalEnemiesKilled)
  totalEnemiesKilled = enemiesDefeated
end

  if (dt/timerThreshold > currentDiff) then -- after long enough in-game, up difficulty
    upDiff()
  end
  if enemiesKilled > threshold then --for every few enemies killed, up difficulty
    upDiff()
    enemiesKilled = 0
    thresholdPassed = thresholdPassed +1
  end
  if thresholdPassed > threshold then --If difficulty goes up enough times, trigger next type of enemy
    currentType = currentType+1
    thresholdPassed = 0
    end
  
  spawnTimer = spawnTimer+1
  
end


function currentCount()
  return enemiesKilled
end

function currentTypeFunc()
  return currentType
end

function currentDiffFunc()
  return currentDiff
end

function upDiff()
  currentDiff = currentDiff +1
end

function checkSpawn() --checks to see if enemy should spawn or not.
  if (spawnTimer == spawnInterval) then
    spawnTimer = 0
    spawnInterval = spawnIntervalDefault - currentDiff
    return true
else
  return false
    end
  end