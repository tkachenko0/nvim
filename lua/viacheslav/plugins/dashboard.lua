return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    enabled = false,
    config = function()
        local alpha = require("alpha")
        local startify = require("alpha.themes.startify")
        startify.section.header.val = {
            [[            _ _,-'_)_  (""`'-._\ `.     ]],
            [[           |,' ,-' __)  ,-     /. |     ]],
            [[           |     -'  _)/         `\     ]],
            [[          ,'       ,-'_,`           :   ]],
            [[       ,-'       ,(,-(              :   ]],
            [[     ,'       ,-' ,    _            ;   ]],
            [[    /        ,-._/`---'            /    ]],
            [[   /        (____)(----. )       ,'     ]],
            [[  /         (      `.__,     /\ /,      ]],
            [[ :           ;-.___         /__\/|      ]],
            [[|         ,'      `--.      -,\ |       ]],
            [[:        /            \    .__/         ]],
            [[\      (__            \    |_           ]],
            [[  \       ,`-,         /   _|,\         ]],
            [[   \    ,'   `-.     ,'_,-'    \        ]],
            [[  (_\,-'    ,'\")--,'-'       __\       ]],
            [[  \       /  // ,'|      ,--'  `-.      ]],
            [[   `-.    `-/ \'  |   _,'         `.    ]],
            [[       `-._ /      `--'/             \  ]],
            [[          ,'           |              \ ]],
            [[        /             |               \ ]],
            [[     ,-'              |               / ]],
            [[    /                 |             -'  ]],
        }
        startify.section.top_buttons.val = {}
        startify.section.mru.val = { { type = "padding", val = 0 } }
        startify.section.bottom_buttons.val = {}
        alpha.setup(startify.opts)
    end,
}
