function resistance = ResistanceToFlow(L, dp, Q)

resistance = abs(L .* dp) ./ Q;
end