# Gomoku on the Internet Computer
A simple Gomoku built on Dfinity. The backend is written in Motoko and the frontend in SvelteJS.

## Read more
- https://dfinity.org/
- https://svelte.dev/

# Access control
https://sdk.dfinity.org/docs/developers-guide/tutorials/access-control.html

# Assign role to frontend user
- https://sdk.dfinity.org/docs/developers-guide/tutorials/access-control.html#_create_a_new_user_identity
- dfx canister call stock assign_role "(principal \"5ecvg-kpzp4-3vakc-nrwom-qrvst-j3bpf-akwmd-wqjrd-27lda-hqmmx-bae\", opt variant{authorized})"

# Pour utiliser l'upload de fichier:
- recuperer le canisterId de SegCan
- le c/c dans initNext de Bigmap
- c'est bon