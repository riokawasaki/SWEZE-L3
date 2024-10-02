require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tweet = tweets(:one) # tweets.ymlで定義されたフィクスチャ
  end

  test "ツイートをcreateすること" do
    assert_difference('Tweet.count', 1) do
      post tweets_url, params: { tweet: { message: "テストツイート" } }
    end
    assert_redirected_to root_path
    follow_redirect!  # リダイレクトされた後のレスポンスを取得
    assert_select 'p', 'ツイートしました' # 期待されるメッセージが表示されるか確認
  end

  test "ツイートを削除すること" do
    assert_difference('Tweet.count', -1) do
      delete tweet_url(@tweet)
    end
    assert_redirected_to root_path
    follow_redirect!  # リダイレクトされた後のレスポンスを取得
    assert_select 'p', 'ツイートを削除しました' # 期待されるメッセージが表示されるか確認
  end

  test "ツイートを更新すること" do
    patch tweet_url(@tweet), params: { tweet: { message: "更新されたツイート" } }
    assert_redirected_to root_path
    follow_redirect!  # リダイレクトされた後のレスポンスを取得
    assert_select 'p', 'ツイートを更新しました' # 期待されるメッセージが表示されるか確認
    @tweet.reload
    assert_equal "更新されたツイート", @tweet.message # ツイートの内容が更新されたことを確認
  end
end
