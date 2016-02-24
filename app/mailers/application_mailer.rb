class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"

  def sign_in_tournament(user, tournament)
    @user = user
    @tournament = tournament
    mail(to: @user.email, subject: 'You subscribed to a tournament')
  end

  def sign_in_tournament_game(user, tournament, game)
    @user = user
    @tournament = tournament
    @game = game
    mail(to: @user.email, subject: 'You\'re in the queue')
  end

  def match_won(match, user)
    @match = match
    @user = user
    mail(to: @user.email, subject: 'You won the match!')
  end

  def match_lost(match, user)
    @match = match
    @user = user
    mail(to: @user.email, subject: 'Unfortunately, you lost...')
  end

  def match_equality(match)
    @match = match
    mail(to: @match.player_1.email, subject: 'Equality!')
    mail(to: @match.player_2.email, subject: 'Equality!')
  end
end
