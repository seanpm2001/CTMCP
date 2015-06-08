% 宣言的オブジェクトとアイデンティティ

% 6.4.2. で宣言的オブジェクトを構築した
% "宣言的オブジェクトは値と操作を安全に結合したものである．
%  しかし，その実装はオブジェクトの一つの面を欠いていた．アイデンティティである"

% 宣言的オブジェクトにアイデンティティ，つまり状態が変わっても保持される同一性を与えよ

% まず 6.4.2. の宣言的(= 状態を持たない)オブジェクト

% 図6.2の3個目
% 「安全, 宣言的, バンドルされている」
% 「宣言的オブジェクトを持つPDAスタイル」

declare
local
   fun {StackObject S}
      fun {Push E} {StackObject E|S} end
      fun {Pop ?E}
         case S of X|S1 then E=X {StackObject S1} end
      end
      fun {IsEmpty} S==nil end
   in stack(push:Push pop:Pop isEmpty:IsEmpty) end
in
   fun {NewStack} {StackObject nil} end
end

% 使用例
declare S1 S2 S3 E in
S1={NewStack}
{Browse {S1.isEmpty}} % => true
S2={S1.push 23}
S3={S2.pop E}
{Browse E} % => 23
