# frozen_string_literal: true

module DataHelpers
  def seed_rewards
    Reward.transaction do
      [1, 100, 1_000, 10_000, 100_000].each do |value|
        Reward.find_or_create_by!(
          kind: :collected_coins,
          required_value: value,
          description: "Conquistado após receber #{value} moeda(s)."
        )

        Reward.find_or_create_by!(
          kind: :killed_turtles,
          required_value: value,
          description: "Conquistado após matar #{value} turtle(s)."
        )

        Reward.find_or_create_by!(
          kind: :killed_bowsers,
          required_value: value,
          description: "Conquistado após matar #{value} bowser(s)."
        )
      end
    end

    Reward.transaction do
      [1, 10, 25, 50, 100].each do |value|
        Reward.find_or_create_by!(
          kind: :deaths,
          required_value: value,
          description: "Conquistado após morrer #{value} vez(es)."
        )
      end
    end
  end
end
