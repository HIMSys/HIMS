CREATE TABLE [dbo].[UserTask]
(
	[Id] INT IDENTITY(1,1) NOT NULL,
    [TaskId] INT NULL, --if task was deleted, for example by mistake, but users' tasks were not
    [UserId] INT NOT NULL,--NOT NULL, 
	[isActive] BIT NULL DEFAULT 0,
	[isDone] BIT NULL DEFAULT 0,

	CONSTRAINT [PK_UserTask] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_UserTask_To_UserProfile] FOREIGN KEY ([UserId]) REFERENCES [UserProfile]([Id]) ON DELETE CASCADE ON UPDATE CASCADE,--SET NULL,--CASCADE ON UPDATE CASCADE, 
    CONSTRAINT [FK_UserTask_To_Task] FOREIGN KEY ([TaskId]) REFERENCES [Task]([Id]) ON DELETE SET NULL 
)
