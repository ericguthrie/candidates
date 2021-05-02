# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |candidate|
    return candidate if candidate[:id] == id
  end
  return nil
end

def experienced?(candidate)
  return true if candidate[:years_of_experience] >= 2
  return false  
end

def github_points?(candidate)
  return true if candidate[:github_points] >= 100
  return false  
end

def languages?(candidate)
  return true if candidate[:languages].include?("Python") || candidate[:languages].include?("Ruby")
  return false  
end

def applied_date?(candidate)
  return true if (Date.today - candidate[:date_applied]) < 15
  return false
end

def age_qualification?(candidate)
  return true if candidate[:age] >= 18
  return false  
end

def qualified_candidates(candidates)
  selected_candidate = []
  candidates.each do |candidate|
    
    next if !experienced?(candidate)
    next if !github_points?(candidate)
    next if !languages?(candidate)
    next if !applied_date?(candidate)
    next if !age_qualification?(candidate)
    selected_candidate.push(candidate);
    
  end
  return selected_candidate;
  
end

def ordered_by_qualifications(candidates)
  sorted_candidates = candidates.sort_by { |hsh| [hsh[:years_of_experience], hsh[:github_points]] }.reverse
  puts sorted_candidates
end
