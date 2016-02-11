----------------------------------------------------------------------------------
-- Total RP 3: Item DB
-- ---------------------------------------------------------------------------
-- Copyright 2015 Sylvain Cossement (telkostrasz@totalrp3.info)
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
----------------------------------------------------------------------------------

TRP3_DB.inner.main = {
	TY = TRP3_DB.types.ITEM,
	BA = {
		NA = "Main inventory",
	},
	CO = {},
}

TRP3_DB.inner.bag = {
	TY = TRP3_DB.types.ITEM,
	BA = {
		IC = "inv_misc_bag_11",
		NA = "Simple bag",
		DE = "Un sac à dos classique",
		UN = 5,
		WE = 0.6,
		WA = true,
	},
	CO = {
		DU = 25,
		MW = 30,
		SI = "5x4",
	},
}

TRP3_DB.inner.smallbag = {
	TY = TRP3_DB.types.ITEM,
	BA = {
		IC = "inv_misc_bag_10",
		NA = "Small bag",
		WE = 0.4,
		WA = true,
	},
	CO = {
		SI = "2x4",
		SR = 2,
	},
}

TRP3_DB.inner.tinybag = {
	TY = TRP3_DB.types.ITEM,
	BA = {
		IC = "inv_misc_bag_09",
		NA = "Tiny bag",
		WE = 0.2,
		WA = true,
	},
	CO = {
		SI = "1x4",
		SR = 1,
	},
}

TRP3_DB.inner.coin1 = {
	TY = TRP3_DB.types.ITEM,
	BA = {
		IC = "INV_Misc_Coin_19",
		NA = "Copper coin",
		DE = "A simple copper coin",
		QA = 2,
		WE = 0.02,
	},
	UN = 10,
	ST = {
		MA = 5,
	},
}

TRP3_DB.inner.fixcontainer = {
	TY = TRP3_DB.types.ITEM,
	BA = {
		IC = "inv_misc_armorkit_17",
		NA = "Bag patch",
		DE = "Fix one durability point for the bag where it stands.",
		QA = 3,
		WE = 0.3,
	},
	US = {
		AC = "Fix bag",
		SC = "onUse",
	},
	SC = {
		["onUse"] = {
			ST = {
				["1"] = {
					t = "list",
					e = {
						{
							id = "durability",
							args = { "con", 1 }
						},
					},
					n = "2"
				},
				["2"] = {
					t = "branch",
					b = {
						{
							cond = { { { i = "lastReturn" }, "==", { v = "0" } } },
							condID = "couldHeal",
							n = "3"
						},
						{
							cond = { { { i = "cond", a = { "couldHeal" } }, "~=", { v = "true" } } },
							n = "4"
						}
					}
				},
				["3"] = {
					t = "list",
					e = {
						{
							id = "consumme",
							args = { 1 }
						},
					},
				},
				["4"] = {
					t = "list",
					e = {
						{
							id = "text",
							args = { "Your bag is already at full health.", 3 }
						},
					},
				},
			}
		}
	},
}

TRP3_DB.inner.dammagecontainer = {
	TY = TRP3_DB.types.ITEM,
	BA = {
		IC = "trade_archaeology_rustedsteakknife",
		NA = "Old rusty knife",
		DE = "Damage for one durability point for the bag where it stands.\nBut you can also use it to kill someone.",
		QA = 3,
		WE = 1.25,
	},
	SC = {
		["onUse"] = {
			ST = {
				["1"] = {
					t = "list",
					e = {
						{
							id = "text",
							args = { "You are thinking of what to do ...", 4 }
						},
					},
					n = "2"
				},
				["2"] = {
					t = "delay",
					d = 2,
					n = "3"
				},
				["3"] = {
					t = "branch",
					b = {
						{
							cond = { { { i = "tar_name" }, "==", { v = "nil" } } },
							condID = "hasTarget",
							n = "4"
						},
						{
							cond = { { { i = "cond", a = { "hasTarget" } }, "~=", { v = "true" } } },
							n = "5"
						}
					},
					n = "3"
				},
				["4"] = {
					t = "list",
					e = {
						{
							id = "durability",
							args = { "con", -1 }
						},
					}
				},
				["5"] = {
					t = "list",
					e = {
						{
							id = "text",
							args = { "You murder your target.", 3 }
						},
						{
							id = "addItem",
							args = { "boubourse", 1, true }
						},
					}
				},
			},
		}
	},
	US = {
		AC = "Damage bag or kill target",
		SC = "onUse",
	},
}
