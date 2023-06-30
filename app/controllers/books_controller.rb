class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    if @book.save
      # フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      # 入力項目が空白だとエラー
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    # 更新メソッド実行
    if @book.update(book_params)
      # フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      # 入力項目が空白だとエラー
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
