# 🏂🏻 Retro's

A Haskell based web app for conducting team retrospectives.

App Features:
- Authentication
- Multi teams support - Create teams, add users to your team, add retro boards to your team.
- Drag-n-drop items between columns
- Add comments to items
- Upvote items
- Easily move columns to other retro boards
- Column header cover images

Tech Features:

- All pages auto refresh data connected directly to Postgres through WebSockets
- Super fast page transitions with [TurboLinks](https://github.com/turbolinks/turbolinks)
- Incremental DOM patching with [MorphDOM](https://github.com/patrick-steele-idem/morphdom)
- Completely written in [Haskell](https://www.haskell.org/)
- Styled with [Tailwind](https://tailwindcss.com/)

![app screenshot](./screenshot.png)

Made with :heart:, haskell, and [IHP](https://github.com/digitallyinduced/ihp).

### Development

- Run `./start` to start the local dev server.
- Dev server available at `localhost:8000`
- Dev server tools available at `localhost:8001`
- Enter into a nix shell if you need: `nix-shell`