# Kanata usage notes

- legacy code in base

To type numbers using right hand only, several rsft mappings
were explored

```kbd
  ;;caps @hold-mod
  ;;caps (chord base-layer-chord 1)
  ;;rsft (tap-dance 200 (@hold-numline @to-numpad-right))
  ;;rsft (chord base-layer-chord 2)

```

- legacy code in mod-layer

This mapping for q was in base layer, which is entirely replaced
by using `caps` in base layer as layer hold action instead
of part of the layer chord.

```kbd
  ;; remember to use tap-hold so they do their original job
  ;; when not chording.
  ;; q (tap-hold 100 200 q (chord layer-chord 1))
  ;; Now it is in mod-layer tap-hold is not needed
  ;; in fact this mapping doesn't even activate deeper layers
  ;; when @hold-mod is held
```

- legacy code in mouse-layer

This is for changing cursor speed by double tapping

```kbd
  ;;(t! map-left (tap-dance 200 (@mleft @mleft-fast)))
  ;;(t! map-up (tap-dance 200 (@mup @mup-fast)))
  ;;(t! map-right (tap-dance 200 (@mright @mright-fast)))
  ;;(t! map-down (tap-dance 200 (@mdown @mdown-fast)))
```
