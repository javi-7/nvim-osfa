local M = {}

local checked_icon = "  "
local unchecked_icon = "󰄱  "

local DEFAULT_OPTS = {
    project = {
        selected = 1
    },
    language = {
        selected = 1
    },
    spring_boot = {
        selected = 1,
        values = {
            "3.2.0 (SNAPSHOT)",
            "3.2.0 (M2)",
            "3.1.4 (SNAPSHOT)",
            "3.1.3",
            "3.0.11 (SNAPSHOT)",
            "3.0.10",
            "2.7.15",
        }
    },
    packaging = {
        selected = 1
    },
    java_version = {
        selected = 2,
        values = { 20, 17, 11, 8 }
    },
    project_metadata = {
        group = "com.example",
        artifact = "demo",
        name = "demo",
        description = "Description Project From Spring Boot",
        package_name = "com.example.demo"
    }
}

function M.setup(opts)
    -- TODO validate opts
end

local function create_dynamic_section(selected, values)
    local result = {}

    for i, v in pairs(values) do
        table.insert(result, { (selected == i and checked_icon or unchecked_icon) ..  v })
    end
    return result
end

function M.create_content()
    local content = {
        { "󰏖  Project", "Type" },
        { (DEFAULT_OPTS.project.selected == 1 and checked_icon or unchecked_icon) .. "Gradle (Groovy)" },
        { (DEFAULT_OPTS.project.selected == 2 and checked_icon or unchecked_icon) .. "Gradle (Kotlin)" },
        { (DEFAULT_OPTS.project.selected == 3 and checked_icon or unchecked_icon) .. "Maven" },
        { "" },
        { "  Language", "Type" },
        { (DEFAULT_OPTS.language.selected == 1 and checked_icon or unchecked_icon) .. "Java" },
        { (DEFAULT_OPTS.language.selected == 2 and checked_icon or unchecked_icon) .. "Kotlin" },
        { (DEFAULT_OPTS.language.selected == 3 and checked_icon or unchecked_icon) .. "Groovy" },
        { "" },
        { "  Spring Boot", "Type" }
    }

    local spring_boot = create_dynamic_section(DEFAULT_OPTS.spring_boot.selected, DEFAULT_OPTS.spring_boot.values)

    local packaging = {
        { "" },
        { "  Packaging", "Type" },
        { (DEFAULT_OPTS.packaging.selected == 1 and checked_icon or unchecked_icon) .. "Jar" },
        { (DEFAULT_OPTS.packaging.selected == 2 and checked_icon or unchecked_icon) .. "War" },
        { "" },
        { " Java Version", "Type" }
    }

    local java_version = create_dynamic_section(DEFAULT_OPTS.java_version.selected, DEFAULT_OPTS.java_version.values)

    local project_metadata = {
        { "" },
        { " Project Metadata", "Type" },
        { "Group        󰁕 " .. DEFAULT_OPTS.project_metadata.group },
        { "Artifact     󰁕 " .. DEFAULT_OPTS.project_metadata.artifact },
        { "Name         󰁕 " .. DEFAULT_OPTS.project_metadata.name },
        { "Package Name 󰁕 " .. DEFAULT_OPTS.project_metadata.package_name },
        { "" },
        { "  Dependencies", "Type" }
    }

    local function add_to_content(values)
        for _, v in pairs(values) do
            table.insert(content, v)
        end
    end

    add_to_content(spring_boot)
    add_to_content(packaging)
    add_to_content(java_version)
    add_to_content(project_metadata)

    return content
end

return M
