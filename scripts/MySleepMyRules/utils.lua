EXTERIOR = "exterior"
INTERIOR = "interior"

function SplitString(input, delimiter)
    local result = {}
    for match in (input..delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match)
    end
    return result
end
