return {
    "catppuccin/nvim",
    name     = "Catppuccin",
    priority = 1000,

    opts = {
        flavour    = 'auto',
        background = {
            light = 'latte',
            dark  = 'mocha'
        },

        transparent_background = true,
        show_end_of_buffer = true,
        term_colors = true,

        styles = {
            comments     = { },
            conditionals = { 'italic' },                        
            loops        = { 'italic' },                                    
            functions    = { 'italic' },                                    
            keywords     = { 'italic', 'bold' },                                    
            strings      = { },                                    
            variables    = { },                                    
            numbers      = { 'bold' },                                    
            booleans     = { 'bold' },                                    
            properties   = { },                                    
            types        = { 'bold' },                                    
            operators    = { },                                    
        },

        integrations = {
            treesitter = true,
            treesitter_context = true
        }
    },

    config = function(plugin, opts)
        require('catppuccin').setup(opts)
        vim.cmd.colorscheme "catppuccin"
    end

}

