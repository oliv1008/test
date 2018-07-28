extends Reference

# octicon v6.0.1

const Icons = {
	"alert": "\uf02d",
	"arrow-down": "\uf03f",
	"arrow-left": "\uf040",
	"arrow-right": "\uf03e",
	"arrow-small-down": "\uf0a0",
	"arrow-small-left": "\uf0a1",
	"arrow-small-right": "\uf071",
	"arrow-small-up": "\uf09f",
	"arrow-up": "\uf03d",
	"microscope": "\uf0dd",
	"beaker": "\uf0dd",
	"bell": "\uf0de",
	"bold": "\uf0e2",
	"book": "\uf007",
	"bookmark": "\uf07b",
	"briefcase": "\uf0d3",
	"broadcast": "\uf048",
	"browser": "\uf0c5",
	"bug": "\uf091",
	"calendar": "\uf068",
	"check": "\uf03a",
	"checklist": "\uf076",
	"chevron-down": "\uf0a3",
	"chevron-left": "\uf0a4",
	"chevron-right": "\uf078",
	"chevron-up": "\uf0a2",
	"circle-slash": "\uf084",
	"circuit-board": "\uf0d6",
	"clippy": "\uf035",
	"clock": "\uf046",
	"cloud-download": "\uf00b",
	"cloud-upload": "\uf00c",
	"code": "\uf05f",
	"color-mode": "\uf065",
	"comment-add": "\uf02b",
	"comment": "\uf02b",
	"comment-discussion": "\uf04f",
	"credit-card": "\uf045",
	"dash": "\uf0ca",
	"dashboard": "\uf07d",
	"database": "\uf096",
	"clone": "\uf0dc",
	"desktop-download": "\uf0dc",
	"device-camera": "\uf056",
	"device-desktop": "\uf27c",
	"device-mobile": "\uf038",
	"diff": "\uf04d",
	"diff-added": "\uf06b",
	"diff-ignored": "\uf099",
	"diff-modified": "\uf06d",
	"diff-removed": "\uf06c",
	"diff-renamed": "\uf06e",
	"ellipsis": "\uf09a",
	"eye-unwatch": "\uf04e",
	"eye-watch": "\uf04e",
	"eye": "\uf04e",
	"file-binary": "\uf094",
	"file-code": "\uf010",
	"file-directory": "\uf016",
	"file-media": "\uf012",
	"file-pdf": "\uf014",
	"file-submodule": "\uf017",
	"file-symlink-directory": "\uf0b1",
	"file-symlink-file": "\uf0b0",
	"file-text": "\uf011",
	"file-zip": "\uf013",
	"flame": "\uf0d2",
	"fold": "\uf0cc",
	"gear": "\uf02f",
	"gift": "\uf042",
	"gist": "\uf00e",
	"gist-secret": "\uf08c",
	"git-branch-create": "\uf020",
	"git-branch-delete": "\uf020",
	"git-branch": "\uf020",
	"git-commit": "\uf01f",
	"git-compare": "\uf0ac",
	"git-merge": "\uf023",
	"git-git-pull-request-abandoned": "\uf009",
	"git-pull-request": "\uf009",
	"globe": "\uf0b6",
	"graph": "\uf043",
	"heart": "\u2665",
	"history": "\uf07e",
	"home": "\uf08d",
	"horizontal-rule": "\uf070",
	"hubot": "\uf09d",
	"inbox": "\uf0cf",
	"info": "\uf059",
	"issue-closed": "\uf028",
	"issue-opened": "\uf026",
	"issue-reopened": "\uf027",
	"italic": "\uf0e4",
	"jersey": "\uf019",
	"key": "\uf049",
	"keyboard": "\uf00d",
	"law": "\uf0d8",
	"light-bulb": "\uf000",
	"link": "\uf05c",
	"link-external": "\uf07f",
	"list-ordered": "\uf062",
	"list-unordered": "\uf061",
	"location": "\uf060",
	"gist-private": "\uf06a",
	"mirror-private": "\uf06a",
	"git-fork-private": "\uf06a",
	"lock": "\uf06a",
	"logo-gist": "\uf0ad",
	"logo-github": "\uf092",
	"mail": "\uf03b",
	"mail-read": "\uf03c",
	"mail-reply": "\uf051",
	"mark-github": "\uf00a",
	"markdown": "\uf0c9",
	"megaphone": "\uf077",
	"mention": "\uf0be",
	"milestone": "\uf075",
	"mirror-public": "\uf024",
	"mirror": "\uf024",
	"mortar-board": "\uf0d7",
	"mute": "\uf080",
	"no-newline": "\uf09c",
	"octoface": "\uf008",
	"organization": "\uf037",
	"package": "\uf0c4",
	"paintcan": "\uf0d1",
	"pencil": "\uf058",
	"person-add": "\uf018",
	"person-follow": "\uf018",
	"person": "\uf018",
	"pin": "\uf041",
	"plug": "\uf0d4",
	"repo-create": "\uf05d",
	"gist-new": "\uf05d",
	"file-directory-create": "\uf05d",
	"file-add": "\uf05d",
	"plus": "\uf05d",
	"primitive-dot": "\uf052",
	"primitive-square": "\uf053",
	"pulse": "\uf085",
	"question": "\uf02c",
	"quote": "\uf063",
	"radio-tower": "\uf030",
	"repo-delete": "\uf001",
	"repo": "\uf001",
	"repo-clone": "\uf04c",
	"repo-force-push": "\uf04a",
	"gist-fork": "\uf002",
	"repo-forked": "\uf002",
	"repo-pull": "\uf006",
	"repo-push": "\uf005",
	"rocket": "\uf033",
	"rss": "\uf034",
	"ruby": "\uf047",
	"search-save": "\uf02e",
	"search": "\uf02e",
	"server": "\uf097",
	"settings": "\uf07c",
	"shield": "\uf0e1",
	"log-in": "\uf036",
	"sign-in": "\uf036",
	"log-out": "\uf032",
	"sign-out": "\uf032",
	"squirrel": "\uf0b2",
	"star-add": "\uf02a",
	"star-delete": "\uf02a",
	"star": "\uf02a",
	"stop": "\uf08f",
	"repo-sync": "\uf087",
	"sync": "\uf087",
	"tag-remove": "\uf015",
	"tag-add": "\uf015",
	"tag": "\uf015",
	"tasklist": "\uf0e5",
	"telescope": "\uf088",
	"terminal": "\uf0c8",
	"text-size": "\uf0e3",
	"three-bars": "\uf05e",
	"thumbsdown": "\uf0db",
	"thumbsup": "\uf0da",
	"tools": "\uf031",
	"trashcan": "\uf0d0",
	"triangle-down": "f05b",
	"triangle-left": "\uf044",
	"triangle-right": "\uf05a",
	"triangle-up": "\uf0aa",
	"unfold": "\uf039",
	"unmute": "\uf0ba",
	"versions": "\uf064",
	"watch": "\uf0e0",
	"remove-close": "\uf081",
	"x": "\uf081",
	"zap": "\u26A1"
}

static func get(key):
	if Icons.has(key):
		return Icons[key];
	return "";
	pass