# Mr. Roboto
# Author: Luiz Cruz - 2021
# Code references from https://sonic-pi.mehackit.org/

use_bpm 100

use_synth :fm
play :c2, attack: 5, release: 0.25
sleep 0.25
play :c2, attack: 3, release: 0.35
sleep 1

live_loop :after_pulse do
  sleep 3
  live_loop :smashedbass do
    use_synth :saw
    use_synth_defaults release: rrand(0.05, 0.25), amp: rrand(1.5, 2)
    with_fx :reverb, mix: 0.6 do
      notes = [(ring :C2, :C3, :r, :Eb3, :r, :G2, :Bb2, :r, :C2),(ring :r, :Eb3, :r, :C2)].choose
      play notes.tick, cutoff: rrand(30, 120)
    end
    sleep 0.25
  end
  
  live_loop :drums do
    timing = [0.5,0.25,1,0.5].choose
    sample :drum_heavy_kick
    sleep timing
    sample :drum_snare_hard
    sleep timing
    sample :drum_heavy_kick
    sleep timing
    sample :drum_snare_hard
    sleep timing
  end
  
  live_loop :pulse do
    use_synth :prophet
    use_synth_defaults amp: 0.1, attack: 4, release: 0.2
    with_fx :wobble , phase: 2, mix: 0.5 do
      play [:r, :C4, :Eb4, :G4].ring.tick, pan: rrand(-1,1)
      sleep 1
    end
    with_fx :whammy , phase: 4, mix: 0.5 do
      play [:r, :C4, :Eb4, :G4].ring.tick, pan: rrand(-1,1)
      sleep 3
    end
    
  end
  
  live_loop :beat do
    with_fx :slicer, phase: 0.125 do
      sample :bass_trance_c, 0, attack: 8, amp: 1, rpitch: 10
    end
    sleep 8
  end
  
  live_loop :hihat do
    sample :drum_cymbal_soft, amp: 0.4
    sleep 0.5
  end
  
  live_loop :snare do
    sleep 1
    sample :drum_snare_soft, amp: 1.3
    sleep 1
  end
  
  
end

