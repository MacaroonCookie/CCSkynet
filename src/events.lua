__event_table = {}
__event_entry_templ = {"func": nil, "event": nil, "name": nil}
__event_listening = true

function event_listen(name, event, func)
 if __event_table[name] == nil then
   __event_table[name] = {"func": func, "name": name, "event": event}
 else
   error('Event already exists')
 end
done

function event_remove(name)
  if __event_table[name] != nil  then
    __event_table[name] = nil
    return true
  else
    return false
  end
done

function listen()
  
done
