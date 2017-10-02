CREATE TABLE [dbo].[UserTask]
(
	[Id] INT NOT NULL,
    [TaskId] INT NOT NULL, 
    [UserId] INT NOT NULL, 
    [TodoId] INT NOT NULL, 
    [ProgressId] INT NOT NULL, 
    [TimeStamp] TIMESTAMP NOT NULL

	CONSTRAINT [PK_UserTask] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_UserTask_To_UserProfile] FOREIGN KEY ([UserId]) REFERENCES [UserProfile]([Id]) ON DELETE SET NULL, 
    CONSTRAINT [FK_UserTask_To_Task] FOREIGN KEY ([TaskId]) REFERENCES [Task]([Id]) ON DELETE SET NULL, 
    CONSTRAINT [FK_UserTask_To_Todo] FOREIGN KEY ([TodoId]) REFERENCES [Todo]([Id]) ON DELETE SET NULL, 
    CONSTRAINT [FK_UserTask_To_Progress] FOREIGN KEY ([ProgressId]) REFERENCES [Progress]([Id]) ON DELETE SET NULL
)
