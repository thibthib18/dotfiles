local entry_display = require "telescope.pickers.entry_display"

local function gen_from_name()
    local make_display = function(entry)
        if not entry then
            return nil
        end

        local columns = {
            {entry.name}
        }

        local displayer =
            entry_display.create {
            separator = " ",
            items = {
                {remaining = true}
            }
        }

        return displayer(columns)
    end

    return function(entry)
        if not entry or vim.tbl_isempty(entry) then
            return nil
        end

        return {
            value = 1,
            ordinal = entry.name,
            display = make_display,
            name = entry.name
        }
    end
end

local function gen_entries(results)
    local entries = {}
    for _, name in ipairs(results) do
        table.insert(entries, {name = name})
    end
    return entries
end

return {
    gen_entries = gen_entries,
    gen_from_name = gen_from_name
}
